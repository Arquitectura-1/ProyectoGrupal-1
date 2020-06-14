import numpy as np
from matplotlib import pyplot
import cv2
imagentxt = open("3.txt","r")
imgMatrix = np.zeros((640, 480),dtype=int)
flag = 0
msb = ''
lsb = ''
i = 0
j = 0
def expmod(base):
    indice = 1
    for i in range (0,755):
        indice = (base*indice)%4399
    return indice

while True:
    digito = imagentxt.read(1)
    if(digito == ' '):
        if(flag == 0):
            flag = 1
        elif(flag == 1):
            flag = 0

            msbbin = str(bin(int(msb))[2:].zfill(8))
            lsbbin = str(bin(int(lsb))[2:].zfill(8))
            pixelbin = msbbin+lsbbin
            pixelint = int(pixelbin,2)
            msb = ''
            lsb = ''
            pixel = expmod(pixelint)
            imgMatrix[i][j] = pixel
            
            if(j == 479):
                j = 0
                i += 1
            else:
                j += 1
    elif(digito == '.'):
        break
            

    elif(flag==0):
        msb +=digito
    elif(flag==1):
        lsb+=digito

cv2.imwrite("imagen.png",imgMatrix)
pyplot.imshow(imgMatrix,cmap='gray')
pyplot.show()
       

