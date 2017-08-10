from PIL import Image
from naoqi import ALProxy
from numpy import *
from ImagenFromCamera import *

import os
import sys
import time
import almath

def main(IP , PORT):
    print ("Estoy en el Main")
    try:
        motionProxy = ALProxy("ALMotion", IP, PORT)
        postureProxy = ALProxy("ALRobotPosture", IP, PORT)
        speechProxy = ALProxy("ALTextToSpeech", IP, PORT)
        # speechProxy.setLanguage("Spanish")
    except Exception, e:
        print "No es posible conectar"
        print "Error: ", e

    motionProxy.wakeUp()
    postureProxy.goToPosture("StandInit", 0.5)
    # time.sleep(3)
    # speechProxy.say("get Image...")
    ImagenCaptureContinus(IP, PORT)
    # ImagenCaptureMiddleTactilTouched(IP, PORT)
    # x = 0.0
    # y = 0.0
    # theta = 0.0
    # speechProxy.say("ready to move")
    # time.sleep(5)
    # motionProxy.moveTo(x, y, theta)
    # theta = 1.50
    # motionProxy.moveTo(x, y, theta)
    # speechProxy.say("Ok!... Ending")
    # motionProxy.rest()

if __name__ == '__main__':
    # Conectarse con el Robot
    IP = "192.168.241.224"
    PORT = 9559
    # Funcion Principal
    main(IP, PORT)

    print ("Termino el main")
