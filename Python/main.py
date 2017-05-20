#!/usr/bin/python
# encoding: latin1
from My_Python_Defs import *
import numpy as np
import cv2
from skimage.transform import (hough_line)
import matplotlib.pyplot as plt


# from matplotlib import cm



def main():
    # Incia cuenta del tiempo
    tic()
    # leemos imagen
    img = cv2.imread("../ImagenesTest/1.png")
    print "Img Dimensions: ", img.shape
    # conversion de la imagene en niveles de grices
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    # umbraliza la imagen
    [ret, imgth] = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY)
    # Detector de bordes con Canny
    edges = cv2.Canny(imgth, 150, 200, apertureSize=3)
    # Trasformada de Hough
    [h, theta, d] = hough_line(edges)
    [P, T, R] = hough_line_peaks(h, theta, d)
    print "T: ", T
    print "R: ", R
    # Elegir las lineas cercanas de 83  a 90 y de -83 a -90
    T = np.asarray(np.ceil(np.rad2deg(T)))
    T_index = np.nonzero(((T >= 83) & (T < 90)) | ((T > -90) & (T <= -83)))
    # T_index = np.nonzero(((T >= 83) & (T < 90)) | ((T > 70) & (T <= 80)) | ((T > 10) & (T <= 20)))
    print "T: ", T
    print "T_index: ", T_index
    print "T[]: ", T[T_index]
    # Fin del tiempo
    toc()

    # Grafica la Deteccion de lineas en el espacio de Hough
    # grafHough(img, h, theta, d, np.deg2rad(T[T_index]), R[T_index])
    Tx = T[T_index]
    error = Tx-90 if Tx > 0 else 90+Tx
    print "Error: ", error
    # print len(Tx)
    # plt.figure(3)
    plt.imshow(img, cmap=cm.gray)
    for i in range(len(Tx)):
        angle = np.deg2rad(Tx[i])
        dist = R[i]
        print "Angle: ", np.rad2deg(angle), "Dist: ", dist
        y0 = (dist - 0 * np.cos(angle)) / np.sin(angle)
        y1 = (dist - img.shape[1] * np.cos(angle)) / np.sin(angle)
        plt.plot((0, img.shape[1]), (y0, y1), '-r')
        pass
    plt.xlim((0, img.shape[1]))
    plt.ylim((img.shape[0], 0))
    plt.title('Lineas Detectadas')
    plt.show()
    pass


if __name__ == '__main__':
    main()
    pass
