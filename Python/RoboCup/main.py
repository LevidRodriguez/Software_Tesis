#!/usr/bin/python
# encoding: latin1
from My_Python_Defs import *
import numpy as np
import cv2
from skimage.transform import (hough_line)
import math


def main():
    tic()  # start time
    # get image from: ImgsNAO1G/, 0.5m-c-grd/ 1m-c-grd/ 1m-c-grd-half35cm/
    path = "imgs/"
    # file = open(path + "resultadosX23.txt", "w")
    lst_files = ls2(path, "png")
    for im in lst_files:
        print ">>>imagen: ", im
        # Leemos Imagen
        img = cv2.imread(path + im)
        # =============Extraer solo lo verde===================
        # conversion de la imagen en color HSV
        hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
        verde_bajos = np.array([15, 71, 54], dtype=np.uint8)
        verde_altos = np.array([95, 151, 134], dtype=np.uint8)
        mascara_verde = cv2.inRange(hsv, verde_bajos, verde_altos)
        # kernel = np.ones((6, 6), np.uint8)
        # mascara_verde = cv2.morphologyEx(mascara_verde, cv2.MORPH_CLOSE, kernel)
        # mascara_verde = cv2.morphologyEx(mascara_verde, cv2.MORPH_OPEN, kernel)
        # cv2.imshow('verde', mascara_verde)
        # cv2.waitKey(0)
        # cv2.destroyAllWindows()
        # img = mascara_verde

        # =====================================================
        Gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        # N = img.shape[1] / 2
        # umbraliza la imagen
        [ret, imgth] = cv2.threshold(Gray, 50, 255, cv2.THRESH_BINARY)
        # Detector de bordes con Canny
        edges = cv2.Canny(imgth, 50, 200, apertureSize=3)
        # Trasformada de Hough

        [h, theta, d] = hough_line(edges)
        print theta
        print d
        [P, T, R] = hough_line_peaks(h, theta, d)
        ###################################################
        # Elegir las lineas cercanas de 83  a 90 y de -83 a -90
        T = np.asarray(np.ceil(np.rad2deg(T)))
        R = np.asarray(np.ceil(R))
        # T_index = np.where(T.__abs__() == T.__abs__().max())[0]
        linesImgOrig(img, T, R)

        pass
    toc()  # finish time

    # Grafica la Deteccion de lineas en el espacio de Hough
    # grafHough(img, h, theta, d, np.deg2rad(T[T_index]), R[T_index])

    # Grafica La linea Detectada en la Imagen Original
    # linesImgOrig(img, T_Ok, R_Ok)
    pass


if __name__ == '__main__':
    main()
    pass
