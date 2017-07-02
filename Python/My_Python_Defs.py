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
        plt.plot((0, img.shape[1]), (y0, y1), '-b')
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
        if file_extension == "." + type_file:
            list_find_files.append(file_name + file_extension)
            pass
        pass
    return list_find_files
    pass


def defProyectiva(img, a):
    print "Entramos..."
    inv_a = np.linalg.inv(a)
    sy, sx = img.shape
    print type(img)
    img = np.double(img)
    print type(img)

    im2 = np.zeros((sy, sx))
    xc = (sx / 2) + 0.5
    yc = (sy / 2) + 0.5
    tic()
    for j in range(sy):
        for i in range(sx):
            x = i - xc
            y = yc - j
            xyz = np.array([[x], [y], [1]])
            uvw = np.dot(inv_a, xyz)
            xi = np.int(uvw[0] / uvw[2])
            yi = np.int(uvw[1] / uvw[2])
            xo = np.int(xi + xc)
            yo = np.int(yc - yi)
            xa = np.int(np.floor(xo))
            xb = np.int(np.ceil(xo))
            ya = np.int(np.floor(yo))
            yb = np.int(np.ceil(yo))

            Dxa = np.int(xo - xa)
            Dxb = np.int(xb - xo)
            Dya = np.int(yo - ya)
            Dyb = np.int(yb - yo)

            A11 = np.int(Dxa * Dya)
            A12 = np.int(Dxb * Dya)
            A21 = np.int(Dxa * Dyb)
            A22 = np.int(Dxb * Dyb)
            if (xo >= 0) & (xo <= sx) & (yo >= 0) & (yo <= sy):
                if (Dxa == 0) & (Dya == 0):
                    try:
                        im2[j][i] = img[yo][xo]
                    except:
                        break
                    pass
                elif (Dxa == 0) & (Dya != 0):
                    im2[j][i] = (img[ya][xo] * Dyb) + (img[yb][xo] * Dya)
                    pass
                elif (Dxa != 0) & (Dya == 0):
                    im2[j][i] = (img[yo][xa] * Dyb) + (img[yo][xb] * Dya)
                    pass
                else:
                    try:
                        im2[j][i] = (img[ya][xa] * A22) + (img[ya][xb] * A21) + (img[yb][xa] * A12) + (
                            img[yb][xb] * A11)
                    except:
                        break
                    pass
                pass
            pass
        pass
    toc()
    print "Valor de i: ", i, "j: ", j
    print "... Salimos\n", type(im2)
    return im2
    pass
