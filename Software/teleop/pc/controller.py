"""
PlayStation controller input handler using pygame.

Axis / button mapping (DualShock 4 / DualSense via Bluetooth):
  Axis 0 : Left  stick X  (left=-1, right=+1)
  Axis 1 : Left  stick Y  (up=-1,   down=+1)  ← inverted
  Axis 2 : Right stick X  (left=-1, right=+1)
  Axis 3 : Right stick Y  (up=-1,   down=+1)

  Button 0 : ×
  Button 1 : ○  → AUTO_MODE toggle
  Button 2 : □  → LED_PATTERN
  Button 3 : △
  Button 4 : L1 → SLOW_MODE
  Button 5 : R1 → FAST_MODE
  Button 9 : OPTIONS → EMERGENCY_STOP
"""

import pygame
from packet import ButtonFlag, RoverCommand

# ── Tuning ──────────────────────────────────────────────────────────────────
DEADZONE        = 0.08   # ignore stick values smaller than this
SLOW_MULTIPLIER = 0.4    # L1: scale down to 40%
FAST_MULTIPLIER = 1.0    # R1: full speed (default is 70%)
DEFAULT_SCALE   = 0.7
# ────────────────────────────────────────────────────────────────────────────


def _apply_deadzone(value: float, zone: float = DEADZONE) -> float:
    """Apply deadzone and rescale so output starts from 0 at zone boundary."""
    if abs(value) < zone:
        return 0.0
    sign = 1.0 if value > 0 else -1.0
    return sign * (abs(value) - zone) / (1.0 - zone)


class ControllerReader:
    """Reads a connected PS controller and produces RoverCommand objects."""

    def __init__(self, joystick_index: int = 0):
        pygame.init()
        pygame.joystick.init()

        count = pygame.joystick.get_count()
        if count == 0:
            raise RuntimeError("No joystick found. Connect your controller first.")

        self._joy = pygame.joystick.Joystick(joystick_index)
        self._joy.init()
        print(f"[Controller] Connected: {self._joy.get_name()}")

        self._auto_mode_on  = False
        self._prev_auto_btn = False   # for edge detection

    def read(self) -> RoverCommand | None:
        """
        Poll events and return the latest RoverCommand.
        Returns None if QUIT event is detected (window close / Ctrl-C).
        """
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return None

        # ── Axes ──────────────────────────────────────────────────────────
        # R2/L2: axis value is -1.0 (not pressed) ~ +1.0 (fully pressed)
        # normalize to 0.0 ~ 1.0
        r2 = (self._joy.get_axis(5) + 1.0) / 2.0   # R2 → forward
        l2 = (self._joy.get_axis(4) + 1.0) / 2.0   # L2 → backward
        raw_v = r2 - l2                              # -1.0 ~ +1.0

        raw_w = self._joy.get_axis(0)               # left stick X

        v = raw_v  # triggers don't need deadzone (start from 0)
        w = _apply_deadzone(raw_w)

        # ── Speed scale ───────────────────────────────────────────────────
        l1 = bool(self._joy.get_button(9))
        r1 = bool(self._joy.get_button(10))

        if l1:
            scale = SLOW_MULTIPLIER
        elif r1:
            scale = FAST_MULTIPLIER
        else:
            scale = DEFAULT_SCALE

        v *= scale
        w *= scale

        # ── Buttons ───────────────────────────────────────────────────────
        flags = ButtonFlag.NONE

        # ○ button: toggle autonomous mode (rising-edge detection)
        auto_btn_now = bool(self._joy.get_button(1))
        if auto_btn_now and not self._prev_auto_btn:
            self._auto_mode_on = not self._auto_mode_on
        self._prev_auto_btn = auto_btn_now

        if self._auto_mode_on:
            flags |= ButtonFlag.AUTO_MODE

        # □ button: LED pattern
        if self._joy.get_button(2):
            flags |= ButtonFlag.LED_PATTERN

        # L1 / R1
        if l1:
            flags |= ButtonFlag.SLOW_MODE
        if r1:
            flags |= ButtonFlag.FAST_MODE

        # OPTIONS: emergency stop
        if self._joy.get_button(6):
            flags |= ButtonFlag.EMERGENCY_STOP

        return RoverCommand(v=v, w=w, buttons=flags)

    def close(self):
        self._joy.quit()
        pygame.quit()
