import time
import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.mplot3d import Axes3D
import importlib.util

# Import bno055_IMU.py
spec = importlib.util.spec_from_file_location("bno055_IMU", "bno055_IMU.py")
bno055_IMU = importlib.util.module_from_spec(spec)
spec.loader.exec_module(bno055_IMU)

# Initialize 3D plot
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# Data lists
x_data, y_data, z_data = [], [], []

def update_data():
    euler = bno055_IMU.sensor.euler
    if euler:
        roll, pitch, yaw = euler
        x_data.append(roll)
        y_data.append(pitch)
        z_data.append(yaw)

        if len(x_data) > 100:  # Limit data length for better visualization
            x_data.pop(0)
            y_data.pop(0)
            z_data.pop(0)

def update_plot():
    ax.cla()  # Clear the previous plot
    ax.plot(x_data, y_data, z_data, label='Orientation (Euler Angles)')
    ax.set_xlabel('Roll (degrees)')
    ax.set_ylabel('Pitch (degrees)')
    ax.set_zlabel('Yaw (degrees)')
    ax.set_title('3D Orientation Visualization')
    ax.legend()
    plt.draw()
    plt.pause(0.01)

try:
    while True:
        update_data()
        update_plot()
        time.sleep(0.1)
except KeyboardInterrupt:
    pass
finally:
    plt.close()

# Run the script
if __name__ == '__main__':
    plt.show()
