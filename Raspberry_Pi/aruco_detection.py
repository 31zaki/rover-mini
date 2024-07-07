import cv2
import cv2.aruco as aruco

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

    return frame, positions
