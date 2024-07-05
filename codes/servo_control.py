import RPi.GPIO as GPIO
import time

# Set GPIO numbering mode
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Set pin 5 as an output, and set servo1 as PWM pin
GPIO.setup(5, GPIO.OUT)
servo1 = GPIO.PWM(5, 50)  # GPIO 5 for PWM with 50Hz

# Start PWM running, with value of 0 (pulse off)
servo1.start(0)

def set_angle(angle):
    # Ensure angle is within the specified range
    if angle < 60:
        angle = 60
    elif angle > 120:
        angle = 120

    # Calculate duty cycle for the specified angle
    duty = angle / 18 + 2
    servo1.ChangeDutyCycle(duty)

try:
    while True:
        angle = float(input("Enter angle between 60 and 120: "))
        if 60 <= angle <= 120:
            set_angle(angle)
            print(f"Servo set to {angle} degrees")
        else:
            print("Invalid angle. Please enter a value between 60 and 120.")

except KeyboardInterrupt:
    servo1.stop()
    GPIO.cleanup()
