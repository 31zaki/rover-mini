import sys
sys.path.append('/home/zach/.local/lib/python3.12/site-packages')

import RPi.GPIO as GPIO
import time
import spidev
from lib_nrf24 import NRF24
from simple_pid import PID
from collections import deque

class ServoController:
    def __init__(self, servo_pin, frequency=50):
        self.servo_pin = servo_pin
        self.frequency = frequency

        GPIO.setmode(GPIO.BCM)
        GPIO.setwarnings(False)

        # Setup servo pin
        GPIO.setup(self.servo_pin, GPIO.OUT)
        self.servo = GPIO.PWM(self.servo_pin, self.frequency)
        self.servo.start(0)

        self.current_angle = 90  # 初期角度を90度に設定
        self.set_angle(self.current_angle)

    def set_angle(self, angle):
        # Ensure angle is within the specified range
        if angle < 70:
            angle = 70
        elif angle > 110:
            angle = 110

        self.current_angle = angle
        # Calculate duty cycle for the specified angle
        duty = angle / 18 + 2
        self.servo.ChangeDutyCycle(duty)
        time.sleep(0.01)  # Allow time for the servo to move and stabilize
        self.servo.ChangeDutyCycle(0)  # Stop sending signal to servo to prevent jitter

    def cleanup(self):
        self.servo.stop()
        GPIO.cleanup()

# Initialize the radio
GPIO.setmode(GPIO.BCM)

pipes = [[0xE8, 0xE8, 0xF0, 0xF0, 0xE1]]
radio = NRF24(GPIO, spidev.SpiDev())
radio.begin(0, 19)
radio.setPayloadSize(1)  # Payload size is now 1 byte
radio.setChannel(0x77)
radio.setDataRate(NRF24.BR_1MBPS)
radio.setPALevel(NRF24.PA_MIN)

radio.setAutoAck(False)
radio.enableDynamicPayloads()
radio.enableAckPayload()

radio.openReadingPipe(1, pipes[0])
radio.printDetails()
radio.startListening()

# Initialize the servo controller
servo_pin = 5  # GPIO pin connected to the servo
servo = ServoController(servo_pin)

# Initialize PID controller
pid = PID(0.8, 0.1, 0.05, setpoint=90)
pid.output_limits = (70, 110)

# Initialize moving average filter
window_size = 5  # 移動平均フィルタのウィンドウサイズ
moving_average = deque(maxlen=window_size)

try:
    while True:
        if radio.available():
            rcvd = []
            radio.read(rcvd, radio.getDynamicPayloadSize())
            print(f"Raw data received: {rcvd}")

            if len(rcvd) == 1:
                pot_value = rcvd[0] * 4  # 値を元のスケールに戻す
                print(f"Received potentiometer value: {pot_value}")

                # Add received value to the moving average filter
                moving_average.append(pot_value)

                # Calculate the average value
                avg_value = sum(moving_average) / len(moving_average)
                print(f"Average potentiometer value: {avg_value}")

                # Map potentiometer value to servo angle (1023 -> 70°, 512 -> 90°, 0 -> 110°)
                desired_angle = 110 - (avg_value / 1023.0) * (110 - 70)

                # Use PID to calculate the new angle
                angle = pid(desired_angle)
                print(f"Setting servo angle: {angle}")
                servo.set_angle(angle)

        time.sleep(0.005)  # Reduced sleep time for more frequent checks
except KeyboardInterrupt:
    servo.cleanup()
    GPIO.cleanup()
