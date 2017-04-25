# Captura de Imagenes
from PIL import Image
from naoqi import ALProxy
from numpy import *

import os
import sys
import time
import datetime
import almath

###VERSION 3 CAPTURA AL PRESIONAR BOTON TACTIL
"""def CapMiddleTactTouched(IP, PORT):
    try:
        memoryProxy = ALProxy("ALMemory", IP, PORT)
        motionProxy = ALProxy("ALMotion", IP, PORT)
        pass
    except Exception as e:
        print "No se puede conectar a ALMemory"
        print "Error: ", e
    
    time.sleep(1)  
    try:
        alerta = 0.0
        while alerta == 0.0:
            print "Waiting to middle tactile sensor..."
            val = memoryProxy.getData("MiddleTactilTouched")
            if val == 1.0:
                xdate = datetime.datetime.now()
                fname1 = "Image_" + str(xdate.isoformat())
                naoImage = ImageFromCamera(IP, PORT,fname1, 1)
                print "Imagen" + fname1 + "Guardada... "
                time.sleep(1)
                alerta = 1.0
                pass
            pass
        print "Finish"
        pass
    except Exception as e:
        raise e
    pass
"""
###VERSION 2 Version Automatica
def ImagenCaptureContinus(IP, PORT):
    try:
        memoryProxy = ALProxy("ALMemory", IP, PORT)
        motionProxy = ALProxy("ALMotion", IP, PORT)
    except Exception, e:
        print "No se puede conectar a ALMemory"
        print "Error: ", e
    names = ["HeadYaw"]  # Articulacion a Mover
    angle2move = linspace(-0.5, 0.5, 190)      # Incremento de Angulo
    i = 0
    angles = [angle2move[i]]  # Angulo a Mover
    fractionMaxSpeed = 0.2  # Velocida de Movimiento

    try:
        while i < 190:
            angles = [angle2move[i]]
            # print "Angulo = ", round(angles[0]*180)
            motionProxy.setAngles(names, angles, fractionMaxSpeed)  # Ejecuta Movimiento
            time.sleep(1)
            fname1 = str(i+1) + "_CameraDown_" + str(round(angle2move[i] * 180))
            naoImage = ImageFromCamera(IP, PORT, fname1, 1)
            i = i + 1
            # print "Imagen Guardada"
            time.sleep(1)
            pass
        motionProxy.rest()
    except KeyboardInterrupt:
        motionProxy.rest()
        print
        print "Interupted by user, shutting down"
    pass

def ImageFromCamera(IP, PORT,FileName, Index):
    camProxy = ALProxy("ALVideoDevice", IP, PORT)
    resolution = 2  # VGA
    colorSpace = 11 # RGB
    camProxy.openCamera(Index)
    videoClient = camProxy.subscribeCamera("python_client", Index, resolution, colorSpace, 5)
    t0 = time.time()
    # Captura la Imagen de la Camara
    naoImage = camProxy.getImageRemote(videoClient)
    t1 = time.time()
    print "Tiempo de adquicion", t1 - t0
    camProxy.unsubscribe(videoClient)
    # Retornamos la imagen y es salvada en png con IMageDraw
    # Tamano de la Imagen
    imageWidth = naoImage[0]
    imageHeight = naoImage[1]
    array = naoImage[6]
    # Creamos la imagen con PIL a partir del array
    img = Image.frombytes("RGB", (imageWidth, imageHeight), array)
    # Guardar la Imagen
    img.save(FileName + ".png", "PNG")