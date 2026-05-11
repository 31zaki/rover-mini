from drive_pid import DrivePID
from machine import UART, Pin, PWM
import struct
import time

# 起動時LED点滅
led = Pin("LED", Pin.OUT)
for i in range(5):
    led.on()
    time.sleep(0.1)
    led.off()
    time.sleep(0.1)

PACKET_HEADER = 0xFE
PACKET_SIZE   = 5

drive = DrivePID()
uart  = UART(0, baudrate=9600, tx=Pin(0), rx=Pin(1))

def decode(data):
    if len(data) != PACKET_SIZE or data[0] != PACKET_HEADER:
        return None
    _, v_u, w_u, flags, checksum = struct.unpack("BBBBB", data)
    if (v_u ^ w_u ^ flags) != checksum:
        return None
    v = (v_u if v_u < 128 else v_u - 256)
    w = (w_u if w_u < 128 else w_u - 256)
    return v, w, flags

buf = b""
last_packet_time = time.ticks_ms()
WATCHDOG_MS = 500  # 500ms以内にパケットが来なければ停止

print("Pico PID ready.")

while True:
    # UART受信
    if uart.any():
        buf += uart.read()
        last_packet_time = time.ticks_ms()

        while len(buf) >= PACKET_SIZE:
            if buf[0] != PACKET_HEADER:
                buf = buf[1:]
                continue

            packet = buf[:PACKET_SIZE]
            buf    = buf[PACKET_SIZE:]

            result = decode(packet)
            if result:
                v, w, flags = result
                if flags & 0x10:  # EMERGENCY_STOP
                    drive.stop()
                    print("EMERGENCY STOP")
                else:
                    drive.set_velocity(v, w)
            else:
                print("checksum error")

    # ウォッチドッグ：パケットが途絶えたら停止
    if time.ticks_diff(time.ticks_ms(), last_packet_time) > WATCHDOG_MS:
        drive.stop()

    # PID更新
    drive.update()
