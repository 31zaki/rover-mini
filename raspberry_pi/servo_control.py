'''import pigpio
import time

class ServoController:
    def __init__(self, pin, frequency=50):
        self.pin = pin
        self.frequency = frequency
        self.pi = pigpio.pi()
        self.pi.set_mode(self.pin, pigpio.OUTPUT)
        self.set_angle(90)  # Initialize to neutral position

    def set_angle(self, angle):
        # Ensure angle is within the specified range
        if angle < 55:
            angle = 55
        elif angle > 115:
            angle = 115

        # Calculate pulse width for the specified angle
        pulse_width = int((500 + (angle * 11.11)))  # Convert angle to pulse width in microseconds
        self.pi.set_servo_pulsewidth(self.pin, pulse_width)
        time.sleep(0.5)  # Allow time for the servo to move and stabilize

    def cleanup(self):
        self.pi.set_servo_pulsewidth(self.pin, 0)  # Stop sending pulses to the servo
        self.pi.stop()

# Example usage
if __name__ == "__main__":
    servo = ServoController(pin=17)  # Specify the GPIO pin
    try:
        while True:
            angle = float(input("Enter angle between 55 and 115: "))
            servo.set_angle(angle)
    except KeyboardInterrupt:
        pass
    finally:
        servo.cleanup()
'''

import pigpio
from time import sleep
# 実行前にsudo pigpiodを忘れずに
pig = pigpio.pi()
pig.set_mode(12, pigpio.ALT0) #OUTPUTの他にALT0-5のモードがある

counter = 0
while (counter < 3):
    pig.hardware_PWM(12, 50, 120000) #サーボは50Hzで制御する
    sleep(1)
    pig.hardware_PWM(12, 50, 72500) #7.25%のdutycycle
    sleep(1)
    pig.hardware_PWM(12, 50, 25000)
    sleep(1)
    pig.hardware_PWM(12, 50, 72500)
    sleep(1)
    counter = counter + 1

pig.hardware_PWM(12, 50, 0)
pig.set_mode(12, pigpio.INPUT)
pig.stop()

