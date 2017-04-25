import numpy as np
import cv2


def main():
    """

    :rtype: object
    """
    print "Version de OpenCV"
    print cv2.__version__
    im = cv2.imread("Imagen14.png")
    cv2.imshow("Imgs",im)
    gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
    edges = cv2.Canny(gray, 150, 200, apertureSize=3)
    lines = cv2.HoughLines(edges, 1, np.pi / 180, 200)
    for rho, theta in lines[0]:
        a = np.cos(theta)
        b = np.sin(theta)
        x0 = a * rho
        y0 = b * rho
        x1 = int(x0 + 1000 * (-b))
        y1 = int(y0 + 1000 * (a))
        x2 = int(x0 - 1000 * (-b))
        y2 = int(y0 - 1000 * (a))
        cv2.line(im, (x1, y1), (x2, y2), (0, 0, 255), 2)
        pass

    cv2.imshow("Hough Lines", im)
    print lines[0]
    # cv2.imshow("Hough Lines Gray", gray)
    # cv2.imshow("Hough Lines Edges", edges)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    pass


if __name__ == '__main__':
    main()
