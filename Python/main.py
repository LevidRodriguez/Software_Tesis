#!/usr/bin/python
# encoding: latin1
from My_Python_Defs import *
import numpy as np
import cv2
from skimage.transform import (hough_line)


def main():
    # Incia cuenta del tiempo
    tic()
    # leemos imagen
    img = cv2.imread("../ImagenesTest/96.png")
    print "Img Dimensions: ", img.shape
    # conversion de la imagene en niveles de grices
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    # umbraliza la imagen
    [ret, imgth] = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY)
    # Detector de bordes con Canny
    edges = cv2.Canny(imgth, 150, 200, apertureSize=3)
    # Trasformada de Hough
    [h, theta, d] = hough_line(edges)
    # h2 = np.floor(np.log10(h+1))
    # h3 = np.floor(np.exp(h2))
    [P, T, R] = hough_line_peaks(h, theta, d)
    # Elegir las lineas cercanas de 83  a 90 y de -83 a -90
    T = np.asarray(np.ceil(np.rad2deg(T)))
    print T
    R = np.asarray(np.ceil(R))
    print R
    T_index = np.nonzero(((T >= 83) & (T <= 90)) | ((T >= -90) & (T <= -83)))
    # T_index = np.nonzero(((T >= 83) & (T < 90)) | ((T > 70) & (T <= 80)) | ((T > 10) & (T <= 20)))
    T_Ok = T[T_index]
    print T_Ok
    R_Ok = R[T_index]
    print R_Ok
    error = T_Ok - 90 if T_Ok > 0 else 90 + T_Ok
    print error
    # Determinar Ubicacion del robot
    # Determinar Rotacion
    # Determinar Distacia Perpendicular
    D_real = (0.0003 * np.power(R_Ok, 2)) - (0.325*R_Ok) + 100.0675
    print D_real

    # Fin del tiempo
    toc()

    # Grafica la Deteccion de lineas en el espacio de Hough
    # grafHough(img, h, theta, d, np.deg2rad(T[T_index]), R[T_index])

    # Grafica La linea Detectada en la Imagen Original
    linesImgOrig(img, T_Ok, R_Ok)
    pass


if __name__ == '__main__':
    main()
    pass
