import time
from motor_control import MotorControl
from servo_control import ServoController

# Motor pins
motor1_pins = (24, 23, 18)
motor2_pins = (27, 22, 25)

# Initialize motor control
motors = MotorControl(motor1_pins, motor2_pins)

# Servo pin
servo_pin = 5  # GPIO pin connected to the servo
servo = ServoController(servo_pin)

try:
    while True:
        command = input("Enter command (w=forward, s=backward, a=servo left, d=servo right, q=quit): ").strip()
        if command == 'w':
            motors.move_forward()
            print('moving forward')
        elif command == 's':
            motors.move_backward()
            print('moving backward')
        elif command == 'a':
            servo.set_angle(70)
            print('Servo set to 70 degrees (left)')
        elif command == 'd':
            servo.set_angle(110)
            print('Servo set to 110 degrees (right)')
        elif command == 'q':
            print('STOP')
            break
        else:
            motors.stop_motors()

except KeyboardInterrupt:
    pass
finally:
    motors.cleanup()
    servo.cleanup()
