from My_Python_Defs import *
import numpy as np
import cv2
import math


def defProyectiva(img, a):
    print "Entramos..."
    inv_a = np.linalg.inv(a)
    sy, sx = img.shape
    im2 = np.zeros((sy, sx))
    xc = (sx / 2) + 0.5
    yc = (sy / 2) + 0.5
    for j in range(sy):
        for i in range(sx):
            x = i - xc
            y = yc - j
            xyz = np.array([[x], [y], [1]])
            uvw = np.dot(inv_a, xyz)
            xi = np.float(uvw[0]/uvw[2])
            yi = np.float(uvw[1]/uvw[2])
            xo = xi + xc
            yo = yc - yi
            xa = np.floor(xo)
            xb = np.ceil(xo)
            ya = np.floor(yo)
            yb = np.ceil(yo)
            Dxa = xo - xa
            Dxb = xb - xo
            Dya = yo - ya
            Dyb = yb - yo

            A11 = Dxa * Dya
            A12 = Dxb * Dya
            A21 = Dxa * Dyb
            A22 = Dxb * Dyb

            if (xo >= 0) & (xo <= sx) & (yo >= 0) & (yo <= sy):
                if (Dxa == 0) & (Dya == 0):
                    im2[j][i] = img[yo][xo]
                    pass
                elif (Dxa == 0) & (Dya != 0):
                    im2[j][i] = (img[ya][xo] * Dyb) + (img[yb][xo] * Dya)
                    pass
                elif (Dxa != 0) & (Dya == 0):
                    im2[j][i] = (img[yo][xa] * Dyb) + (img[yo][xb] * Dya)
                    pass
                else:
                    try:
                        im2[j][i] = (img[ya][xa] * A22) + (img[ya][xb] * A21) + (img[yb][xa] * A12) + (img[yb][xb] * A11)
                    except :
                        break
                    pass
                pass
            pass
        pass
    print "... Salimos"
    return im2
    pass
