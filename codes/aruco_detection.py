mport cv2
import cv2.aruco as aruco

def detect_aruco_tags(frame):
  # Convert the frame to grayscale
  gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

  # Load the ARUCO dictionary
  aruco_dict = aruco.Dictionary_get(aruco.DICT_6X6_250)
  parameters = aruco.DetectorParameters_create()

  # Detect ARUCO markers in the grayscale image
  corners, ids, rejected = aruco.detectMarkers(gray, aruco_dict, parameters=parameters)

  # Draw detected markers on the frame
  if ids is not None:
   aruco.drawDetectedMarkers(frame, corners, ids)

  return frame
