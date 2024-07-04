from flask import Flask, Response
import cv2
from face_detection import detect_faces

app = Flask(__name__)

def generate_frames():
    camera = cv2.VideoCapture(0)

    # Set camera parameters (FPS and resolution)
    camera.set(cv2.CAP_PROP_FPS, 30)  # Set to 30 FPS
    camera.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)  # Set width to 1280
    camera.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)  # Set height to 720

    if not camera.isOpened():
        print("Error: Could not open video device.")
        return

    while True:
        success, frame = camera.read()
        if not success:
            break
        else:
            # Detect faces in the frame
            frame = detect_faces(frame)

            # Reduce the processing time by directly encoding the frame
            ret, buffer = cv2.imencode('.jpg', frame, [int(cv2.IMWRITE_JPEG_QUALITY), 90])
            frame = buffer.tobytes()
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

@app.route('/video_feed')
def video_feed():
    return Response(generate_frames(),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
