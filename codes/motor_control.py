import RPi.GPIO as GPIO

class MotorControl:
    def __init__(self, motor1_pins, motor2_pins, pwm_freq=100):
        self.motor1_in1, self.motor1_in2, self.motor1_ena = motor1_pins
        self.motor2_in3, self.motor2_in4, self.motor2_enb = motor2_pins

        GPIO.setmode(GPIO.BCM)
        GPIO.setwarnings(False)

        GPIO.setup(self.motor1_in1, GPIO.OUT)
        GPIO.setup(self.motor1_in2, GPIO.OUT)
        GPIO.setup(self.motor1_ena, GPIO.OUT)
        GPIO.setup(self.motor2_in3, GPIO.OUT)
        GPIO.setup(self.motor2_in4, GPIO.OUT)
        GPIO.setup(self.motor2_enb, GPIO.OUT)

        self.pwm1 = GPIO.PWM(self.motor1_ena, pwm_freq) #?
        self.pwm2 = GPIO.PWM(self.motor2_enb, pwm_freq)
        self.pwm1.start(0)
        self.pwm2.start(0)

    def stop_motors(self):
        self.pwm1.ChangeDutyCycle(0)
        self.pwm2.ChangeDutyCycle(0)

    def move_forward(self, speed=75):
        GPIO.output(self.motor1_in1, GPIO.LOW)
        GPIO.output(self.motor1_in2, GPIO.HIGH)
        GPIO.output(self.motor2_in3, GPIO.LOW)
        GPIO.output(self.motor2_in4, GPIO.HIGH)
        self.pwm1.ChangeDutyCycle(speed)
        self.pwm2.ChangeDutyCycle(speed)

    def move_backward(self, speed=75):
        GPIO.output(self.motor1_in1, GPIO.HIGH)
        GPIO.output(self.motor1_in2, GPIO.LOW)
        GPIO.output(self.motor2_in3, GPIO.HIGH)
        GPIO.output(self.motor2_in4, GPIO.LOW)
        self.pwm1.ChangeDutyCycle(speed)
        self.pwm2.ChangeDutyCycle(speed)

    def cleanup(self):
        self.stop_motors()
        GPIO.cleanup()
