import struct
from dataclasses import dataclass
from enum import IntFlag

PACKET_HEADER = 0xFF
PACKET_SIZE   = 5

class ButtonFlag(IntFlag):
    NONE           = 0x00
    AUTO_MODE      = 0x01
    LED_PATTERN    = 0x02
    SLOW_MODE      = 0x04
    FAST_MODE      = 0x08
    EMERGENCY_STOP = 0x10

@dataclass
class RoverCommand:
    v: float
    w: float
    buttons: ButtonFlag = ButtonFlag.NONE

    def _clamp_to_int8(self, val):
        return max(-100, min(100, int(round(val * 100))))

    def encode(self):
        v_byte = self._clamp_to_int8(self.v)
        w_byte = self._clamp_to_int8(self.w)
        btn    = int(self.buttons) & 0xFF
        v_u = v_byte & 0xFF
        w_u = w_byte & 0xFF
        checksum = v_u ^ w_u ^ btn
        return struct.pack("BBBBB", PACKET_HEADER, v_u, w_u, btn, checksum)

    def __str__(self):
        v_pct = int(self.v * 100)
        w_pct = int(self.w * 100)
        flags = [f.name for f in ButtonFlag if f in self.buttons and f != ButtonFlag.NONE]
        return f"v={v_pct:+4d}%  w={w_pct:+4d}%  [{', '.join(flags) or '-'}]"

def decode(data):
    if len(data) != PACKET_SIZE or data[0] != PACKET_HEADER:
        return None
    _, v_u, w_u, btn, checksum = struct.unpack("BBBBB", data)
    if (v_u ^ w_u ^ btn) != checksum:
        return None
    v_i = v_u if v_u < 128 else v_u - 256
    w_i = w_u if w_u < 128 else w_u - 256
    return RoverCommand(v=v_i/100.0, w=w_i/100.0, buttons=ButtonFlag(btn))
