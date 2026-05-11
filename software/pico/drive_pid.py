from motor_pid import MotorPID

MAX_RPM = 100  # 最大目標RPM

class DrivePID:
    def __init__(self):
        self.rf = MotorPID(pin1=4,  pin2=5,  enc_a=8)
        self.rr = MotorPID(pin1=14, pin2=15, enc_a=16)
        self.lf = MotorPID(pin1=3,  pin2=2,  enc_a=6)
        self.lr = MotorPID(pin1=11, pin2=10, enc_a=12)

    def set_velocity(self, v, w):
        # v, w: -100 ~ +100
        left  = v - w
        right = v + w

        # 正規化
        scale = max(abs(left), abs(right), 100) / 100
        left  /= scale
        right /= scale

        # RPMに変換
        left_rpm  = left  / 100 * MAX_RPM
        right_rpm = right / 100 * MAX_RPM

        self.lf.set_target_rpm(left_rpm)
        self.lr.set_target_rpm(left_rpm)
        self.rf.set_target_rpm(right_rpm)
        self.rr.set_target_rpm(right_rpm)

    def update(self):
        self.lf.update()
        self.lr.update()
        self.rf.update()
        self.rr.update()

    def stop(self):
        self.lf.stop()
        self.lr.stop()
        self.rf.stop()
        self.rr.stop()
