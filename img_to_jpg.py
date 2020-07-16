import cv2
import numpy as np
from matplotlib import pyplot as plt


encriptado = open('Encriptado.img','r')
desencriptado = open('Desencriptado.img','r')
encriptadoMatriz = [[]]
desencriptadoMatriz = [[]]
i = 0
contadorAncho = 0
for linea in encriptado:
    contadorColumna = 1
    if(linea[-2] != "x" and contadorAncho == 480):
        encriptadoMatriz.append([])
        i += 1
        contadorAncho = 0
    for valor in linea.split():
        if(contadorColumna == 6 and valor != "xxxxxxxx"):
            encriptadoMatriz[i].append(int(valor,2))
            contadorAncho += 1
        contadorColumna += 1

i = 0
contadorAncho = 0
for linea in desencriptado:
    contadorColumna = 1
    if(linea[-2] != "x" and contadorAncho == 480):
        desencriptadoMatriz.append([])
        i += 1
        contadorAncho = 0
    for valor in linea.split():
        if(contadorColumna == 6 and valor != "xxxxxxxx"):
            desencriptadoMatriz[i].append(int(valor,2))
            contadorAncho += 1
        contadorColumna += 1
print(np.asarray(desencriptadoMatriz).size)
cv2.imwrite("encriptado.jpg", np.asarray(encriptadoMatriz))
cv2.imwrite("desencriptado.jpg", np.asarray(desencriptadoMatriz))

