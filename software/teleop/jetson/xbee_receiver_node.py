import sys
import time
import argparse
import threading

sys.path.append(str(__file__).replace("jetson/xbee_receiver_node.py", "common"))

import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
from std_msgs.msg import Int32
from packet import decode, RoverCommand, ButtonFlag, PACKET_HEADER, PACKET_SIZE

DEFAULT_PORT      = "/dev/ttyUSB0"
DEFAULT_BAUDRATE  = 115200
MAX_LINEAR_SPEED  = 1.0
MAX_ANGULAR_SPEED = 2.0
WATCHDOG_TIMEOUT  = 0.5

class XBeeReceiverNode(Node):
    def __init__(self, port, baudrate, mock):
        super().__init__("xbee_receiver")
        self._cmd_vel_pub = self.create_publisher(Twist, "/cmd_vel", 10)
        self._buttons_pub = self.create_publisher(Int32, "/rover/buttons", 10)
        self._watchdog = self.create_timer(WATCHDOG_TIMEOUT, self._watchdog_cb)
        self._last_packet_time = time.monotonic()
        self._emergency_stop = False
        self._recv_count  = 0
        self._error_count = 0

        if mock:
            self.get_logger().info("[Mock] Running without XBee.")
            t = threading.Thread(target=self._mock_reader, daemon=True)
        else:
            import serial
            self._ser = serial.Serial(port, baudrate=baudrate, timeout=1.0)
            self.get_logger().info(f"[XBee] Opened {port} @ {baudrate} baud")
            t = threading.Thread(target=self._serial_reader, daemon=True)
        t.start()
        self.get_logger().info("XBee receiver node started.")

    def _serial_reader(self):
        buf = b""
        while rclpy.ok():
            try:
                buf += self._ser.read(PACKET_SIZE)
                buf = self._process_buffer(buf)
            except Exception as e:
                self.get_logger().error(f"Serial read error: {e}")
                time.sleep(0.1)

    def _process_buffer(self, buf):
        while len(buf) >= PACKET_SIZE:
            if buf[0] != PACKET_HEADER:
                buf = buf[1:]
                continue
            packet = buf[:PACKET_SIZE]
            buf    = buf[PACKET_SIZE:]
            cmd = decode(packet)
            if cmd:
                self._recv_count += 1
                self._last_packet_time = time.monotonic()
                self._handle_command(cmd)
            else:
                self._error_count += 1
                self.get_logger().warn(f"Checksum error: {packet.hex(' ').upper()}")
        return buf

    def _mock_reader(self):
        import math
        t = 0.0
        while rclpy.ok():
            v = math.sin(t) * 0.5
            w = math.cos(t) * 0.3
            cmd = RoverCommand(v=v, w=w)
            self._last_packet_time = time.monotonic()
            self._handle_command(cmd)
            time.sleep(0.05)
            t += 0.1

    def _handle_command(self, cmd):
        if ButtonFlag.EMERGENCY_STOP in cmd.buttons:
            self._emergency_stop = True
            self.get_logger().warn("[!!] EMERGENCY STOP")
            self._publish_stop()
            return
        if not self._emergency_stop:
            twist = Twist()
            twist.linear.x  = cmd.v * MAX_LINEAR_SPEED
            twist.angular.z = cmd.w * MAX_ANGULAR_SPEED
            self._cmd_vel_pub.publish(twist)
        btn_msg = Int32()
        btn_msg.data = int(cmd.buttons)
        self._buttons_pub.publish(btn_msg)
        self.get_logger().debug(str(cmd))

    def _watchdog_cb(self):
        elapsed = time.monotonic() - self._last_packet_time
        if elapsed > WATCHDOG_TIMEOUT:
            self._publish_stop()
            self.get_logger().warn(f"Watchdog: no packet for {elapsed:.1f}s")

    def _publish_stop(self):
        self._cmd_vel_pub.publish(Twist())

    def destroy_node(self):
        self._publish_stop()
        if hasattr(self, "_ser"):
            self._ser.close()
        self.get_logger().info(f"Shutdown. recv={self._recv_count} errors={self._error_count}")
        super().destroy_node()

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--port",     "-p", default=DEFAULT_PORT)
    parser.add_argument("--baudrate", "-b", default=DEFAULT_BAUDRATE, type=int)
    parser.add_argument("--mock",           action="store_true")
    args = parser.parse_args()

    rclpy.init()
    node = XBeeReceiverNode(port=args.port, baudrate=args.baudrate, mock=args.mock)
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == "__main__":
    main()
