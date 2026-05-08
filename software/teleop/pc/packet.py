"""
Packet definition and encoding for rover-mini teleop communication.

Packet format (5 bytes):
  [0xFF] [v: int8] [w: int8] [buttons: uint8] [checksum: uint8]

  v        : linear velocity  -100 ~ +100 (% of max speed)
  w        : angular velocity -100 ~ +100 (% of max turn rate)
  buttons  : bitmask (see ButtonFlag)
  checksum : v_byte XOR w_byte XOR buttons
"""

import struct
from dataclasses import dataclass
from enum import IntFlag


PACKET_HEADER = 0xFF
PACKET_SIZE   = 5


class ButtonFlag(IntFlag):
    """Bitmask definitions for the buttons byte."""
    NONE          = 0x00
    AUTO_MODE     = 0x01  # bit0: ○  autonomous mode toggle
    LED_PATTERN   = 0x02  # bit1: □  LED pattern cycle
    SLOW_MODE     = 0x04  # bit2: L1 slow speed mode
    FAST_MODE     = 0x08  # bit3: R1 fast speed mode
    EMERGENCY_STOP = 0x10  # bit4: OPTIONS / START


@dataclass
class RoverCommand:
    """Human-readable rover command before encoding."""
    v: float              # linear velocity  -1.0 ~ +1.0
    w: float              # angular velocity -1.0 ~ +1.0
    buttons: ButtonFlag = ButtonFlag.NONE

    def _clamp_to_int8(self, val: float) -> int:
        """Convert -1.0~+1.0 float to -100~+100 int8."""
        scaled = int(round(val * 100))
        return max(-100, min(100, scaled))

    def encode(self) -> bytes:
        """Encode command into 5-byte packet."""
        v_byte = self._clamp_to_int8(self.v)
        w_byte = self._clamp_to_int8(self.w)
        btn    = int(self.buttons) & 0xFF

        # int8 → unsigned byte for struct packing
        v_u = v_byte & 0xFF
        w_u = w_byte & 0xFF

        checksum = v_u ^ w_u ^ btn

        return struct.pack("BBBBB", PACKET_HEADER, v_u, w_u, btn, checksum)

    def __str__(self) -> str:
        v_pct = int(self.v * 100)
        w_pct = int(self.w * 100)
        flags = [f.name for f in ButtonFlag if f in self.buttons and f != ButtonFlag.NONE]
        return f"v={v_pct:+4d}%  w={w_pct:+4d}%  [{', '.join(flags) or '-'}]"


def decode(data: bytes) -> RoverCommand | None:
    """
    Decode a 5-byte packet back to RoverCommand.
    Returns None if the packet is invalid.
    """
    if len(data) != PACKET_SIZE or data[0] != PACKET_HEADER:
        return None

    _, v_u, w_u, btn, checksum = struct.unpack("BBBBB", data)

    if (v_u ^ w_u ^ btn) != checksum:
        return None  # checksum mismatch

    # unsigned byte → signed int8
    v_i = v_u if v_u < 128 else v_u - 256
    w_i = w_u if w_u < 128 else w_u - 256

    return RoverCommand(
        v       = v_i / 100.0,
        w       = w_i / 100.0,
        buttons = ButtonFlag(btn),
    )
