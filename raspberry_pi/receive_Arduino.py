import RPi.GPIO as GPIO
import time
import spidev
from lib_nrf24 import NRF24

GPIO.setmode(GPIO.BCM)

pipes = [0xE8, 0xE8, 0xF0, 0xF0, 0xE1]
radio = NRF24(GPIO, spidev.SpiDev())
radio.begin(0, 19)
radio.setPayloadSize(32)
radio.setChannel(0x77)
radio.setDataRate(NRF24.BR_1MBPS)
radio.setPALevel(NRF24.PA_MIN)

radio.setAutoAck(False)
radio.enableDynamicPayloads()
radio.enableAckPayload()

radio.openReadingPipe(1, pipes)
radio.printDetails()
radio.startListening()

while True:

    if not radio.available(0):
        time.sleep(1)

    else:
        rcvd = []
        radio.read(rcvd, radio.getDynamicPayloadSize())
        string = ""
        for n in rcvd:
            if (n >= 32 and n <= 126):
                string += chr(n)
        print("got.{}". format(string))
        radio.flush_rx()

GPIO.cleanup()
