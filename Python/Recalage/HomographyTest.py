from My_Python_Defs import *
import cv2
import numpy as np
from skimage import transform as tf
from skimage import data
import math
import matplotlib.pyplot as plt
from matplotlib import cm


def main():
    # Read the images to be aligned
    im1 = cv2.imread("Imgs2Recalage/girasol.bmp")
    im2 = cv2.imread("Imgs2Recalage/girasoln.bmp")

    # Convert images to grayscale
    im1_gray = cv2.cvtColor(im1, cv2.COLOR_BGR2GRAY)
    im2_gray = cv2.cvtColor(im2, cv2.COLOR_BGR2GRAY)

    # Matrix to Pojective Transform
    Sx = 1.0
    Sy = 1.0
    Th = 0.9
    Dx = 0.0
    Dy = 0.0
    a31 = 0.000025
    a32 = -0.00182

    Th_rad = np.deg2rad(Th)
    # H = np.array([[Sx * np.cos(Th_rad), -2 * Sy * np.sin(Th_rad), Dx],
    #               [Sy * np.sin(Th_rad), 1.4 * Sx * np.cos(Th_rad), Dy],
    #               [a31, a32, 1]])
    H2 = np.matrix([[Sx * np.cos(Th_rad), -2 * Sy * np.sin(Th_rad), Dx],
                    [Sy * np.sin(Th_rad), 1.4 * Sx * np.cos(Th_rad), Dy],
                    [a31, a32, 1]])

    print type(H2)

    # img2 = defProyectiva(im1_gray, H2)
    # img3 = filtroPasaBajas(im1_gray, 0.05) -> blur
    blur = cv2.blur(im1_gray, (3, 3))

    imReducida = reduceImagen(im1_gray, 0.5)
    ty,tx = im1_gray.shape
    print im1_gray.shape
    print imReducida.shape
    plt.figure()
    plt.imshow(im1_gray, cmap=cm.gray)
    plt.figure()
    plt.imshow(imReducida, cmap=cm.gray)
    # plt.figure()
    # plt.imshow(blur, cmap=cm.gray)
    plt.show()

    # cv2.imshow("Imagen 1", im1_gray)
    # cv2.imshow("Imagen 2", im2_gray)

    pass


if __name__ == '__main__':
    main()
    pass
