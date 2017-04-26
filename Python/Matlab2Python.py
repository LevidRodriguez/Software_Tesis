""" Programa Principal """
import cv2
import numpy as np
from My_Python_Defs import *

def main():
    # Abrir la imagen
    # img  = cv2.imread("14_CameraDown_-78.0.png", 0)
    img = cv2.imread("../ImagenesTest/Imagen14.png", 0)
    img.dtype
    [f, c] = img.shape # Numero de Filas y Columnas de la Imagen
    # Umbralizacion de la Imagen
    [ret, imgth] = cv2.threshold(img, 200, 255, cv2.THRESH_BINARY)
    cv2.imwrite("threshold.png", imgth)
    # Detection de Bordes
    edges = cv2.Canny(imgth, 100, 200)

    H = cv2.HoughLines(edges, 1, np.pi/180, 100)
    H_Original = H
    H = np.floor(np.log10(H, out=None), out=None)
    H = np.floor(np.exp(H, out=None), out=None)
    # Determination de la Linea de Mayor Longitud
    P = FindLineMaxLength(np.asmatrix(H))
    # Determinacion del angulo real del robot
    # angulo = P[:, 2] - 91
    print "H: ", H , "P: " , P
    pass

if __name__ == '__main__':
    main()
