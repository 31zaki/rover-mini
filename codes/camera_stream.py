from flask import Flask, Response
import cv2
import threading
from aruco_detection import detect_aruco_tags

app = Flask(__name__)

# Global variables to hold the frame and a lock for thread safety
output_frame = None
lock = threading.Lock()

def capture_frames():
    global output_frame, lock

    camera = cv2.VideoCapture(0)

    # Set camera parameters (FPS and resolution)
    camera.set(cv2.CAP_PROP_FPS, 24)  # Set to 24 FPS
    camera.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)  # Set width to 1280
    camera.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)  # Set height to 720

    if not camera.isOpened():
        print("Error: Could not open video device.")
        return

    while True:
        success, frame = camera.read()
        if not success:
            print("Error: Could not read frame.")
            break
        else:
            print("Frame captured")
            # Detect ARUCO tags in the frame
            frame = detect_aruco_tags(frame)

            # Acquire the lock and update the global frame variable
            with lock:
                output_frame = frame.copy()

def generate_frames():
    global output_frame, lock

    while True:
        with lock:
            if output_frame is None:
                continue

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
    t = threading.Thread(target=capture_frames)
    t.daemon = True
    t.start()

    # Start the Flask application
    app.run(host='0.0.0.0', port=5000, debug=True)
