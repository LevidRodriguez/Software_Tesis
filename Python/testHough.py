import numpy as np
import cv2


def main():
    print "Este es el main..."
    print "OpenCV Version: " + cv2.__version__
    img = cv2.imread("Imagen14.png")
    cv2.imshow("Imagen De Entrada",img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    pass


if __name__ == '__main__':
    main()
