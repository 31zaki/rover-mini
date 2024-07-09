import RPi.GPIO as GPIO
import time

class ServoController:
    def __init__(self, servo_pin, pot_pin, frequency=50):
        self.servo_pin = servo_pin
        self.pot_pin = pot_pin
        self.frequency = frequency

        GPIO.setmode(GPIO.BCM)
        GPIO.setwarnings(False)

        # Setup servo pin
        GPIO.setup(self.servo_pin, GPIO.OUT)
        self.servo = GPIO.PWM(self.servo_pin, self.frequency)
        self.servo.start(0)

        # Setup potentiometer pin
        GPIO.setup(self.pot_pin, GPIO.IN)

    def set_angle(self, angle):
        # Ensure angle is within the specified range
        if angle < 70:
            angle = 70
        elif angle > 110:
            angle = 110

        # Calculate duty cycle for the specified angle
        duty = angle / 18 + 2
        self.servo.ChangeDutyCycle(duty)
        time.sleep(0.5)  # Allow time for the servo to move and stabilize

    def read_potentiometer(self):
        # Simulate reading the potentiometer value (0-1023)
        pot_value = GPIO.input(self.pot_pin)
        # Map the potentiometer value to an angle between 70 and 110
        angle = 70 + (pot_value / 1023.0) * (110 - 70)
        return angle

    def move_servo_with_potentiometer(self):
        angle = self.read_potentiometer()
        self.set_angle(angle)

    def cleanup(self):
        self.servo.stop()
        GPIO.cleanup()

# Example usage
if __name__ == "__main__":
    servo_pin = 5  # GPIO pin connected to the servo
    pot_pin = 18  # GPIO pin connected to the potentiometer
    servo = ServoController(servo_pin, pot_pin)

    try:
        while True:
            servo.move_servo_with_potentiometer()
            time.sleep(0.1)
    except KeyboardInterrupt:
        pass
    finally:
        servo.cleanup()
