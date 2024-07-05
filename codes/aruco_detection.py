import cv2
import cv2.aruco as aruco
import time
import os
import threading

# Global variable to hold the frame and a lock for thread safety
output_frame = None
lock = threading.Lock()

def detect_aruco_tags(frame):
    # Convert the frame to grayscale
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Load the ARUCO dictionary
    aruco_dict = aruco.Dictionary_get(aruco.DICT_6X6_250)
    parameters = aruco.DetectorParameters_create()

    # Detect ARUCO markers in the grayscale image
    corners, ids, rejected = aruco.detectMarkers(gray, aruco_dict, parameters=parameters)

    # Extract the center positions of the detected markers
    positions = []
    if ids is not None:
        for corner in corners:
            c = corner[0]
            x = int((c[0][0] + c[2][0]) / 2)
            y = int((c[0][1] + c[2][1]) / 2)
            positions.append((x, y))

    return positions

def clear_console():
    # Clear the console based on the operating system
    os.system('cls' if os.name == 'nt' else 'clear')

def capture_frames():
    global output_frame, lock

    camera = cv2.VideoCapture(0)

    # Set camera parameters (FPS and resolution)
    camera.set(cv2.CAP_PROP_FPS, 24)  # Set to 24 FPS
    camera.set(cv2.CAP_PROP_FRAME_WIDTH, 640)  # Set width to 640
    camera.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)  # Set height to 480

    if not camera.isOpened():
        print("Error: Could not open video device.")
        return

    while True:
        success, frame = camera.read()
        if not success:
            print("Error: Could not read frame.")
            break
        else:
            with lock:
                output_frame = frame.copy()

def process_frames():
    global output_frame, lock

    while True:
        with lock:
            if output_frame is not None:
                frame = output_frame.copy()
                # Detect ARUCO tags in the frame
                positions = detect_aruco_tags(frame)

                # Clear the console and print the positions of the detected ARUCO tags
                clear_console()
                if positions:
                    print("Detected ARUCO tag positions:", positions)
                else:
                    print("No ARUCO tags detected")
                
                # Add a small delay to control the update rate
                time.sleep(0.1)

if __name__ == "__main__":
    # Start threads for capturing and processing frames
    capture_thread = threading.Thread(target=capture_frames)
    process_thread = threading.Thread(target=process_frames)

    capture_thread.start()
    process_thread.start()

    capture_thread.join()
    process_thread.join()