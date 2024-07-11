import sys
sys.path.append('/home/zach/.local/lib/python3.12/site-packages')

import RPi.GPIO as GPIO
import pigpio
import time
import spidev
from lib_nrf24 import NRF24
from threading import Thread, Event

class ServoController:
    def __init__(self, pi, servo_pin, frequency=50):
        self.pi = pi
        self.servo_pin = servo_pin
        self.frequency = frequency
        self.current_angle = 95  # 初期角度を95度に設定
        self.set_angle(self.current_angle)

    def set_angle(self, angle):
        # Ensure angle is within the specified range
        angle = max(70, min(angle, 120))
        self.current_angle = angle
        # Calculate pulse width for the specified angle
        pulse_width = int((500 + (angle * 11.11)))  # Convert angle to pulse width in microseconds
        self.pi.set_servo_pulsewidth(self.servo_pin, pulse_width)

    def cleanup(self):
        self.pi.set_servo_pulsewidth(self.servo_pin, 0)  # Stop sending pulses to the servo

# Initialize GPIO and the radio
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

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
pi = pigpio.pi()
servo_pin = 12  # GPIO pin connected to the servo
servo = ServoController(pi, servo_pin)

# Event to signal data availability
data_available = Event()
pot_value = 512  # Default to mid-range value (512)
last_valid_pot_value = 512  # To store the last valid potentiometer value

def read_radio_data():
    global pot_value, last_valid_pot_value
    while True:
        if radio.available():
            rcvd = []
            radio.read(rcvd, radio.getDynamicPayloadSize())
            if len(rcvd) == 1:
                received_value = rcvd[0] * 4  # 値を元のスケールに戻す
                # Check if the received value is a sudden jump and either 0 or 1020
                if abs(received_value - last_valid_pot_value) < 250 or (received_value != 0 and received_value != 1020):
                    pot_value = received_value
                    last_valid_pot_value = received_value
                print(f"Received potentiometer value: {pot_value}")
                data_available.set()  # Signal that data is available

# Start the radio data reading thread
radio_thread = Thread(target=read_radio_data, daemon=True)
radio_thread.start()

try:
    while True:
        if data_available.is_set():
            data_available.clear()

            # Map potentiometer value to desired angle (1023 -> 70°, 512 -> 95°, 0 -> 120°)
            desired_angle = 120 - (pot_value / 1023.0) * (120 - 70)
            print(f"Setting servo angle: {desired_angle}")
            servo.set_angle(desired_angle)

        time.sleep(0.001)  # Small sleep time for more frequent checks
except KeyboardInterrupt:
    servo.cleanup()
    pi.stop()
    GPIO.cleanup()
