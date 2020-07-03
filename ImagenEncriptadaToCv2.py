import numpy as np
import cv2
from PIL import Image

matrix = np.zeros((960, 640),dtype=int)
img = open("3.txt","r")
i = 0
j = 0
for pixel in img:
    for valor in pixel.split():
        if(j<640):
            matrix[i][j] = int(valor)
            j += 1
        elif(j==640):
            #matrix.append([])
            j = 0
            i += 1


#cv2.imwrite("Shaperned.jpg", np.asarray(matrix))
img.close()
imgen = Image.fromarray(matrix,'I')
imgen.show()
