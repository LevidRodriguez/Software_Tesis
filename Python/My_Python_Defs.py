"""Archivo My_Python_Defs"""
import numpy as np
import cv2
import matplotlib.pyplot as plt
import os
from matplotlib import cm
from skimage.transform import (hough_line_peaks)
from pathlib2 import Path



def grafHough(img, h, theta, d, T, R):
    plt.figure(1)
    plt.imshow(np.log(1 + h),
               extent=[np.rad2deg(theta[0]), np.rad2deg(theta[-1]), d[-1], d[0]],
               cmap=cm.gray, aspect=1 / 1.5)
    plt.plot(np.rad2deg(T), R, 'or', markersize=5)

    plt.xlabel('Angulos (grados)')
    plt.ylabel('Distancia (pixels)')
    plt.title('Transformada de Hough')

    # Grafica la Deteccion de lineas en el espacio imagen
    plt.figure(2)
    plt.imshow(img, cmap=cm.gray)
    print("Linea - Angulo - Distancia ")
    i = 0
    for _, angle, dist in zip(*hough_line_peaks(h, theta, d)):
        print(i, np.ceil(np.rad2deg(angle)), np.floor(dist))
        y0 = (dist - 0 * np.cos(angle)) / np.sin(angle)
        y1 = (dist - img.shape[1] * np.cos(angle)) / np.sin(angle)
        plt.plot((0, img.shape[1]), (y0, y1), '-r')
        i += 1
    plt.xlim((0, img.shape[1]))
    plt.ylim((img.shape[0], 0))
    plt.title('Lineas Detectadas')

    # plt.figure(3)

    # Mostramos las imagenes
    plt.show()
    pass

def linesImgOrig(img, T, R):
    plt.figure()
    plt.imshow(img, cmap=cm.gray)
    for i in range(len(T)):
        angle = np.deg2rad(T[i])
        dist = R[i]
        y0 = (dist - 0 * np.cos(angle)) / np.sin(angle)
        y1 = (dist - img.shape[1] * np.cos(angle)) / np.sin(angle)
        plt.plot((0, img.shape[1]), (y0, y1), '-r')
        pass
    plt.xlim((0, img.shape[1]))
    plt.ylim((img.shape[0], 0))
    plt.title('Lineas Detectadas')
    plt.show()
    pass

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

def ls(ruta=Path.cwd()):
    """ Retorna una lista con todos los archivos y directorios 
        en un fichero especificado o nulo si es el directorio actual 
        lista = ls(path) # no especificar path para tomar el directorio actual
        lista = lista de nombres de los archivos y directorios 
                encontrados en la direccion path
        path = direccion de donde se quiere conocer el listado de archivos y directorios
        """
    return [arch.name for arch in Path(ruta).iterdir() if arch.is_file()]
    pass

def ls2(path, type_file):
    list_files = ls(path)
    list_find_files = []
    for lst_files in list_files:
        (file_name, file_extension) = os.path.splitext(lst_files)
        if file_extension == "."+type_file:
            list_find_files.append(file_name + file_extension)
            pass
        pass
    return list_find_files
    pass

