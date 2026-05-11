from machine import Pin, PWM
from time import ticks_ms, ticks_diff

COUNTS_PER_REV = 1600
MAX_VOLTAGE    = 12.0
BATT_VOLTAGE   = 8.0
MAX_DUTY       = int(BATT_VOLTAGE / MAX_VOLTAGE * 65535)  # ≈ 43690

class MotorPID:
    def __init__(self, pin1, pin2, enc_a,
                 kp=2.0, ki=3.0, kd=0.01):
        # モーター
        self.in1 = PWM(Pin(pin1))
        self.in2 = PWM(Pin(pin2))
        self.in1.freq(1000)
        self.in2.freq(1000)

        # エンコーダー
        self.enc_a = Pin(enc_a, Pin.IN, Pin.PULL_UP)
        self.count = 0
        self._direction = 1
        self.enc_a.irq(trigger=Pin.IRQ_RISING,
                       handler=self._encoder_cb)

        # PID
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.target_rpm  = 0.0
        self._integral   = 0.0
        self._prev_error = 0.0
        self._prev_count = 0
        self._prev_time  = ticks_ms()

    def _encoder_cb(self, pin):
        self.count += self._direction

    def set_target_rpm(self, rpm):
        self.target_rpm = rpm
        self._integral  = 0.0
        if rpm >= 0:
            self._direction = 1
        else:
            self._direction = -1

    def _set_pwm(self, power):
        power = max(-100, min(100, power))
        duty  = int(abs(power) / 100 * MAX_DUTY)
        if power > 0:
            self.in1.duty_u16(duty)
            self.in2.duty_u16(0)
        elif power < 0:
            self.in1.duty_u16(0)
            self.in2.duty_u16(duty)
        else:
            self.in1.duty_u16(0)
            self.in2.duty_u16(0)

    def update(self):
        now = ticks_ms()
        dt  = ticks_diff(now, self._prev_time) / 1000.0
        if dt < 0.01:
            return

        delta      = self.count - self._prev_count
        actual_rpm = (delta / COUNTS_PER_REV) * 60.0 / dt

        error          = self.target_rpm - actual_rpm
        self._integral += error * dt
        # windup防止
        self._integral = max(-100, min(100, self._integral))
        derivative     = (error - self._prev_error) / dt

        output = (self.kp * error +
                  self.ki * self._integral +
                  self.kd * derivative)

        self._set_pwm(output)

        self._prev_error = error
        self._prev_count = self.count
        self._prev_time  = now

    def stop(self):
        self.target_rpm  = 0.0
        self._integral   = 0.0
        self._set_pwm(0)
