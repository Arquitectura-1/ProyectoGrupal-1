import tkinter as tk
import numpy as np
import cv2
from matplotlib import pyplot as plt
from matplotlib.backends.backend_tkagg import (FigureCanvasTkAgg, NavigationToolbar2Tk)
from matplotlib.backend_bases import key_press_handler
from matplotlib.figure import Figure

def ventana2():
    ventana.destroy()
    ventana2 = tk.Tk()
    ventana2.title("Imagen 480x320")
    ventana2.geometry('640x640')
    boton2 = tk.Button(ventana2, text = "Cerrar", fg="white", bg="maroon4", command=ventana2.destroy)
    boton2.pack(side=tk.BOTTOM)
    fig = plt.figure()
    ax1 = fig.add_subplot(1,1,1)
    ax1.imshow(desencriptadoMatriz, cmap='gray')
    plt.title("Imagen Desencriptada 480x320")
    plt.xticks([]),plt.yticks([])
    canvas = FigureCanvasTkAgg(fig, master=ventana2)
    canvas.draw()
    canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)
    toolbar = NavigationToolbar2Tk(canvas, ventana2)
    toolbar.update()
    canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)
    tk.mainloop()



ventana = tk.Tk()
ventana.wm_title("Imagen 480x640")
ventana.geometry('640x640')
boton = tk.Button(ventana, text = "Ver imagen 480x320", bg="maroon4", fg= "white", command=ventana2)
boton.pack(side=tk.BOTTOM)

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

fig = plt.figure()
ax1 = fig.add_subplot(1,1,1)
ax1.imshow(encriptadoMatriz, cmap='gray')
plt.title("Imagen Encriptada 480x640")
plt.xticks([]),plt.yticks([])
canvas = FigureCanvasTkAgg(fig, master=ventana)
canvas.draw()
canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)
toolbar = NavigationToolbar2Tk(canvas, ventana)
toolbar.update()
canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)
tk.mainloop()

