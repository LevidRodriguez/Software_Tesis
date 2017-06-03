#!/usr/bin/python
# encoding: latin1
from My_Python_Defs import *


def main():
    path = '../ImagenesTest/'
    print "Lee los archivos del directorio path: ", path
    lst_files_png = ls2(path, "png")

    for im in lst_files_png:
        print "Imagen: ", im
        img = cv2.imread(path + im)
        cv2.imshow("Imagen - "+im, img)
        cv2.waitKey(0)
        pass
    pass


if __name__ == '__main__':
    main()
    pass
