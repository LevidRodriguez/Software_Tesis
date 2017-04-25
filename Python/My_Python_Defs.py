"""Archivo My_Python_Defs"""
import numpy as np
import cv2


def FindLineMaxLength(Matrix):
    """Funcion para determinar las coordenadas de el Valor"""
    # Valor Maximo en Matrix
    max = np.amax(Matrix)
    # Arreglo Vacio para guardar las coordenadas
    P = []
    # Tamano de la Matriz
    [f, c] = Matrix.shape
    for i in range(f):
        for j in range(c):
            if Matrix[i, j] == max:
                coordinate = (i, j)
                P.append(coordinate)
                pass
            pass
        pass
    # Regresamos el Arreglo con las coordenadas
    return np.asmatrix(P)
    pass


def convolve(image, kernel):
    """Funcion para determinar la convolucionar una imagen con la mascaras kernel"""
    [iH, iW] = image.shape[:2]
    try:
        [kH, kW] = kernel.shape[:2]
    except:
        kW2 = kernel.shape[:2]
        kW = kW2[0]

    pad = (kW - 1) / 2
    image = cv2.copyMakeBorder(image, pad, pad, pad, pad, cv2.BORDER_REPLICATE)
    outimage = np.zeros((iH, iW), dtype="float32")
    for y in np.arange(pad, iH + pad):
        for x in np.arange(pad, iW + pad):
            roi = image[y - pad:y + pad + 1, x - pad:x + pad + 1]
            k = (roi * kernel).sum()
            outimage[y - pad, x - pad] = k
    """Convertir la imagen en escala 0-255 en formato uint8"""
    # outimage = rescale_intensity(outimage, in_range=(0, 255))
    # outimage = (outimage * 255).astype("uint8")
    return outimage
    pass


def tic():
    # Homemade version of matlab tic and toc functions
    import time
    global startTime_for_tictoc
    startTime_for_tictoc = time.time()


def toc():
    import time
    if 'startTime_for_tictoc' in globals():
        print "Elapsed time is " + str(time.time() - startTime_for_tictoc) + " seconds."
    else:
        print "Toc: start time not set"
