import time
from motor_control import MotorControl

# motor pins
motor1_pins = (24, 23, 18)
motor2_pins = (27, 22, 25)

# initialise motor control
motors = MotorControl(motor1_pins, motor2_pins)

try:
    while True:
        command = input("Enter command (w=forward, s=backward, q=quit): ").strip()
        if command == 'w':
            motors.move_forward()
            print('moving forward')
        elif command == 's':
            motors.move_backward()
            print('moving backward')
        elif command == 'q':
            print('STOP')
            break
        else:
            motors.stop_motors()

except KeyboardInterrupt:
    pass
finally:
    motors.cleanup()
