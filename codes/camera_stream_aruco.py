from flask import Flask, Response
import cv2
import threading
import cv2.aruco as aruco

app = Flask(__name__)

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

    # Draw rectangles around detected markers and extract positions
    positions = []
    if ids is not None:
        for corner in corners:
            c = corner[0]
            x = int((c[0][0] + c[2][0]) / 2)
            y = int((c[0][1] + c[2][1]) / 2)
            positions.append((x, y))
            # Draw rectangle around the marker
            cv2.polylines(frame, [corner.astype(int)], True, (0, 255, 0), 2)

    return positions, frame

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
            # Detect ARUCO tags in the frame and draw rectangles
            positions, annotated_frame = detect_aruco_tags(frame)

            # Print the positions of the detected ARUCO tags
            if positions:
                print("Detected ARUCO tag positions:", positions)
            else:
                print("No ARUCO tags detected")

            with lock:
                output_frame = annotated_frame.copy()

def generate_frames():
    global output_frame, lock

    while True:
        with lock:
            if output_frame is None:
                continue

            # Debug: Output the shape of the frame being processed
            print(f"Processing frame of shape: {output_frame.shape}")

            ret, buffer = cv2.imencode('.jpg', output_frame, [int(cv2.IMWRITE_JPEG_QUALITY), 70])
            if not ret:
                print("Error: Could not encode frame.")
                continue
            frame = buffer.tobytes()

        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

@app.route('/')
def index():
    return "Video feed is running. Go to /video_feed to view the feed."

@app.route('/video_feed')
def video_feed():
    return Response(generate_frames(),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == "__main__":
    # Start a thread to capture frames from the camera
    capture_thread = threading.Thread(target=capture_frames)
    capture_thread.daemon = True
    capture_thread.start()

    # Start the Flask application
    app.run(host='0.0.0.0', port=5000, debug=True)
