import RPi.GPIO as GPIO
import time

class ServoController:
    def __init__(self, pin, frequency=50):
        self.pin = pin
        self.frequency = frequency
        GPIO.setmode(GPIO.BCM)
        GPIO.setwarnings(False)
        GPIO.setup(self.pin, GPIO.OUT)
        self.servo = GPIO.PWM(self.pin, self.frequency)
        self.servo.start(0)

    def set_angle(self, angle):
        # Ensure angle is within the specified range
        if angle < 60:
            angle = 60
        elif angle > 120:
            angle = 120

        # Calculate duty cycle for the specified angle
        duty = angle / 18 + 2
        self.servo.ChangeDutyCycle(duty)
        time.sleep(0.5)  # Allow time for the servo to move and stabilize

    def cleanup(self):
        self.servo.stop()
        GPIO.cleanup()
