import numpy as np
import cv2


def main():
    print "Este es el main..."
    print "OpenCV Version: " + cv2.__version__
    img = cv2.imread("../ImagenesTest/Imagen14.png")
    cv2.imshow("Imagen De Entrada", img)
    gray = cv2.cvtColor(img, cv2.COLOR_BAYER_RG2GRAY)
    edges = cv2.Canny(gray, 150, 200, apertureSize=3)
    lines = cv2.HoughLines(edges, 1, np.pi/180, 200)
    

    cv2.waitKey(0)
    cv2.destroyAllWindows()
    pass


if __name__ == '__main__':
    main()
