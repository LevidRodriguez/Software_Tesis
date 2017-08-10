import cv2
import numpy as np
import matplotlib.pyplot as plt


def main(img):
    img_hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    cv2.imshow("Imagen en HSV", img_hsv)
    bgr = [126, 121, 58]
    thresh = 40
    hsv = cv2.cvtColor(np.uint8([[bgr]]), cv2.COLOR_BGR2HSV)[0][0]
    minHSV = np.array([hsv[0] - thresh, hsv[1] - thresh, hsv[2] - thresh])
    # minHSV = np.array([49, 50, 50])
    print minHSV
    maxHSV = np.array([hsv[0] + thresh, hsv[1] + thresh, hsv[2] + thresh])
    # maxHSV = np.array([100, 255, 210])
    print maxHSV
    maskHSV = cv2.inRange(img_hsv, minHSV, maxHSV)
    resultHSV = cv2.bitwise_and(img_hsv, img_hsv, mask=maskHSV)
    cv2.imshow("Result HSV", resultHSV)
    cv2.waitKey(0)
    cv2.imwrite("resultHSV2.png",resultHSV)
    cv2.destroyAllWindows()
    pass


if __name__ == '__main__':
    img = cv2.imread("imgs/CanchaCameraUp.png")
    cv2.imshow("Imagen Original", img)
    main(img)
    pass
