#!/usr/bin/python
# encoding: latin1
from My_Python_Defs import *
import numpy as np
import cv2
from skimage.transform import (hough_line)
import math


def main():
    tic()  # start time
    # leemos imagen ImgsNAO1G/, 0.5m-c-grd/ 1m-c-grd/ 1m-c-grd-half35cm/
    path = "../ImagenesTest/ImgsNAO1grd-160x120PlusIlumination/"
    file = open(path + "resultadosX23.txt", "w")
    lst_files = ls2(path, "png")
    for im in lst_files:
        print ">>>imagen: ", im
        img = cv2.imread(path + im)
        # conversion de la imagene en niveles de grices
        Gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        N = img.shape[1] / 2
        # umbraliza la imagen
        [ret, imgth] = cv2.threshold(Gray, 200, 255, cv2.THRESH_BINARY)
        # Detector de bordes con Canny
        edges = cv2.Canny(imgth, 150, 200, apertureSize=3)
        ###################################################
        # Trasformada de Hough
        [h, theta, d] = hough_line(edges)
        [P, T, R] = hough_line_peaks(h, theta, d)
        ###################################################
        # Elegir las lineas cercanas de 83  a 90 y de -83 a -90
        T = np.asarray(np.ceil(np.rad2deg(T)))
        R = np.asarray(np.ceil(R))
        T_index = np.where(T.__abs__() == T.__abs__().max())[0]
        linesImgOrig(img, T, R)
        # T_index = np.nonzero(((T >= 45) & (T <= 90)) | ((T >= -90) & (T <= -45)))
        # T_index = np.nonzero(((T >= 83) & (T <= 90)) | ((T >= -90) & (T <= -83)))
        # T_index = np.nonzero(((T >= 83) & (T < 90)) | ((T > 70) & (T <= 80)) | ((T > 10) & (T <= 20)))
        # print T
        # print R
        T = T[T_index]
        T_index = np.nonzero(((T >= 45) & (T <= 90)) | ((T >= -90) & (T <= -45)))
        T_Ok = T[T_index]
        R_Ok = R[T_index]
        ImgNum = im.split('_', 1)
        error = T_Ok - 90 if T_Ok > 0 else 90 + T_Ok
        D_real = (0.0003 * np.power(R_Ok, 2)) - (0.325 * R_Ok) + 100.0675
        print ImgNum[0], "\t", im, " Angulo: ", T_Ok, "Rho: ", R_Ok, "Dist: ", D_real, "Error: ", error
        # Determinar Ubicacion del robot
        # Determinar Rotacion
        """if (T_Ok > -90) & (T_Ok < 0):
            print "Angulo entre -90 y 0"
            alpha_real = 1.4 * T_Ok + 125
            # Determinar Distacia Perpendicular
            ABC = (R_Ok + (N * np.sin(alpha_real) * np.tan(90 - alpha_real))) / (np.sin(alpha_real))
            D_real = (0.0003 * np.power(ABC, 2)) - (0.325 * ABC) + 100.0675
        elif (T_Ok > 0) & (T_Ok < 90):
            print "Angulo entre 0 y 90"
            alpha_real = 1.8 * T_Ok - 160
            ABC = (R_Ok + (N * np.sin(alpha_real) * np.tan(90 - alpha_real))) / (np.sin(alpha_real))
            D_real = (0.0003 * np.power(ABC, 2)) - (0.325 * ABC) + 100.0675
        else:
            print "Angulo 0"
            alpha_real = 0
            D_real = (0.0003 * np.power(R_Ok, 2)) - (0.325 * R_Ok) + 100.0675

        print "Distancia ABC: ", ABC, "Distancia Real[cm]:", D_real, "a un Angulo Alpha Real: ", alpha_real,"\n"
        """
        try:
            file.write(str(ImgNum[0]) + "\t" + im + "\t" + str(T_Ok[0]) + "\t" + str(R_Ok[0]) + "\t" + str(
                D_real) + "\t" + str(error[0]) + "\n")
        except:
            file.write(
                str(ImgNum[0]) + "\t" + im + "\t" + str(T_Ok) + "\t" + str(R_Ok) + "\t" + str(D_real) + "\t" + str(
                    error) + "\n")
        # linesImgOrig(img, T_Ok, R_Ok)
        pass
    file.close()
    toc()  # finish time

    # Grafica la Deteccion de lineas en el espacio de Hough
    # grafHough(img, h, theta, d, np.deg2rad(T[T_index]), R[T_index])

    # Grafica La linea Detectada en la Imagen Original
    # linesImgOrig(img, T_Ok, R_Ok)
    pass


if __name__ == '__main__':
    main()
    pass
