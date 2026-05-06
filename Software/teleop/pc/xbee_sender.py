"""
XBee serial sender for rover-mini teleop.

Wraps pyserial to send encoded RoverCommand packets over the XBee radio.
"""

import time
import serial
import serial.tools.list_ports
from packet import RoverCommand


def list_ports() -> list[str]:
    """Helper: print available serial ports."""
    return [p.device for p in serial.tools.list_ports.comports()]


class XBeeSender:
    """Opens a serial port connected to an XBee module and sends packets."""

    def __init__(self, port: str, baudrate: int = 115200, timeout: float = 1.0):
        """
        Args:
            port     : Serial port (e.g. 'COM3' on Windows, '/dev/ttyUSB0' on Linux/Mac)
            baudrate : Must match XBee module configuration (default 115200)
            timeout  : Read timeout in seconds (write is non-blocking)
        """
        try:
            self._ser = serial.Serial(port, baudrate=baudrate, timeout=timeout)
            time.sleep(0.1)  # wait for port to settle
            print(f"[XBee] Opened {port} @ {baudrate} baud")
        except serial.SerialException as e:
            raise RuntimeError(f"[XBee] Failed to open {port}: {e}") from e

        self._last_send_time = 0.0
        self._send_count     = 0
        self._error_count    = 0

    def send(self, cmd: RoverCommand) -> bool:
        """
        Encode and send a RoverCommand packet.

        Returns True on success, False on serial error.
        """
        packet = cmd.encode()
        try:
            written = self._ser.write(packet)
            self._last_send_time = time.monotonic()
            self._send_count += 1
            return written == len(packet)
        except serial.SerialException as e:
            self._error_count += 1
            print(f"[XBee] Send error: {e}")
            return False

    def send_stop(self) -> bool:
        """Send an immediate stop command (v=0, w=0, EMERGENCY_STOP flag)."""
        from packet import ButtonFlag
        stop_cmd = RoverCommand(v=0.0, w=0.0, buttons=ButtonFlag.EMERGENCY_STOP)
        return self.send(stop_cmd)

    @property
    def stats(self) -> dict:
        return {
            "sent":   self._send_count,
            "errors": self._error_count,
        }

    def close(self):
        if self._ser.is_open:
            self.send_stop()
            self._ser.close()
            print("[XBee] Port closed.")
