import time
import board
import busio
import adafruit_bno055

# create I2C bus interface
i2c = busio.I2C(board.SCL, board.SDA)

# create the BNO055 object
sensor = adafruit_bno055.BNO055_I2C(i2c)

# function to print sensor data
def print_sensor_data():
    print("Temperature: {} degrees C".format(sensor.temperature))
    print("Accelerometer (m/s^2): {}".format(sensor.acceleration))
    print("Magnetometer (microteslas): {}".format(sensor.magnetic))
    print("Gyroscope (deg/sec): {}".format(sensor.gyro))
    print("Euler angle: {}".format(sensor.euler))
    print("Quaternion: {}".format(sensor.quaternion))
    print("Linear acceleration (m/s^2): {}".format(sensor.linear_acceleration))
    print("Gravity (m/s^2): {}".format(sensor.gravity))
    print("")

while True:
  print_sensor_data()
  time.sleep(1)
