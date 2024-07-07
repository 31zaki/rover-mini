from flask import Flask, jsonify
import cv2
import threading
import cv2.aruco as aruco

app = Flask(__name__)

# Global variable to hold the positions and a lock for thread safety
output_positions = None
lock = threading.Lock()

def detect_aruco_tags(frame):
    # Convert the frame to grayscale
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Load the ARUCO dictionary
    aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_6X6_250)
    parameters = aruco.DetectorParameters()

    # Detect ARUCO markers in the grayscale image
    corners, ids, rejected = aruco.detectMarkers(gray, aruco_dict, parameters=parameters)

    # Extract positions of detected markers
    positions = []
    if ids is not None:
        for corner in corners:
            c = corner[0]
            x = int((c[0][0] + c[2][0]) / 2)
            y = int((c[0][1] + c[2][1]) / 2)
            positions.append((x, y))

    return positions

def capture_frames():
    global output_positions, lock

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
            # Detect ARUCO tags in the frame
            positions = detect_aruco_tags(frame)

            # Print the positions of the detected ARUCO tags
            if positions:
                print("Detected ARUCO tag positions:", positions)
            else:
                print("No ARUCO tags detected")

            with lock:
                output_positions = positions

@app.route('/')
def index():
    with lock:
        positions = output_positions if output_positions else []
    return jsonify(positions)

if __name__ == "__main__":
    # Start a thread to capture frames from the camera
    capture_thread = threading.Thread(target=capture_frames)
    capture_thread.daemon = True
    capture_thread.start()

    # Start the Flask application on port 5001
    app.run(host='0.0.0.0', port=5001, debug=True)
