"""
    prueba de Hough Lines de OpenCV
    Levid Rodriguez Santiago
    21 de Abril de 2017
    Maestria en Robotica - UTM
    last checking 21 de Abril de 2017
"""



def main():
    print "Este es el main..."
    print "OpenCV Version: " + cv2.__version__
    # Lee imagen
    img = cv2.imread("../ImagenesTest/Imagen14.png", 0)
    # con Conversion a escala de grices
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    # Umbraliza la Imagen
    [ret, imgth] = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY)
    # Deteccion de Bordes con el Algoritmo de Canny
    edges = cv2.Canny(imgth, 150, 200, apertureSize=3)

    lines = cv2.HoughLines(edges, 1, np.pi / 180, 100)
    print ("Lines: ")
    print(lines)
    for rho, theta in lines[0]:
        a = np.cos(theta)
        b = np.sin(theta)
        x0 = a * rho
        y0 = b * rho
        x1 = int(x0 + 1000 * (-b))
        y1 = int(y0 + 1000 * (a))
        x2 = int(x0 - 1000 * (-b))
        y2 = int(y0 - 1000 * (a))
        cv2.line(img, (x1, y1), (x2, y2), (0, 0, 255), 2)
        pass

    cv2.imshow("HoughLines", img)

    # Trasformada de Hough
    [h, theta, d] = hough_line(edges)
    print "h: ", h
    # Grafica la Deteccion de lineas en el espacio de Hough
    plt.figure(1)
    plt.imshow(np.log(1 + h),
               extent=[np.rad2deg(theta[-1]), np.rad2deg(theta[0]), d[-1], d[0]],
               cmap=cm.gray, aspect=1 / 1.5)
    plt.xlabel('Angulos (grados)')
    plt.ylabel('Distancia (pixels)')
    plt.title('Transformada de Hough')

    # plt.figure(2)
    # plt.imshow(img, cmap=cm.gray)
    # for _, angle, dist in zip(*hough_line_peaks(h, theta, d)):
    #    y0 = (dist - 0 * np.cos(angle)) / np.sin(angle)
    #    y1 = (dist - img.shape[1] * np.cos(angle)) / np.sin(angle)
    #    plt.plot((0, img.shape[1]), (y0, y1), '-r')
    # plt.xlim((0, img.shape[1]))
    # plt.ylim((img.shape[0], 0))
    # plt.title('Lineas Detectadas')

    plt.show()

    cv2.waitKey(0)
    cv2.destroyAllWindows()
    pass


if __name__ == '__main__':
    main()
    pass

