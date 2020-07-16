# ProyectoGrupal-Arqui1
Este proyecto consiste en un ASIP capaz de desencriptar una imagen mediante el algoritmo RSA.

## Requisitos

Debe tener instalado [quartus 18.1](https://www.intel.com/content/www/us/en/programmable/downloads/download-center.html), [modelsim](https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/model-sim.html) y [Python](https://www.python.org/downloads/). También se necesita descargar el archivo para compilar y programar la FPGA [Cyclone V terasic DE1-SoC-M TL2](https://www.intel.com/content/www/us/en/programmable/downloads/download-center.html) 

Utilizando el instalador de paquetes de Python, instalar las librerías necesarias.

```bash
-pip install numpy
-pip install matplot
-pip install 
-pip install cv2 
-pip install tkinter
```

## Uso
1. Descargar el .zip de este proyecto y descomprimirlo.
2. Abrir el .qof desde Quartus y cambiar las rutas de archivos encontradas en los archivos cuyo nombre es relativo a memorias para que se ajusten a su computador.
3. Compilar el proyecto y programar la FPGA.
4. Si desea simularlo, debe compilar el proyecto desde Modelsim, una vez compilado, abrir el vga_tb.sv y ejecutar la simulación.
5. Cuando finaliza la simulación, abrir el archivo img_to_jpgGUI.py que se encuentra en la carpeta y ejecutarlo. Esto mostrará la imagen encriptada y la desencriptada.

El proyecto cuenta con un compilador de código para generar el binario que corre el procesador, si desea ejecutar un código que no es el base, debe asegurarse que los riesgos de datos están bien corregidos (mediante el uso de nops). Si desea compilar el código debe realizar el siguiente procedimiento.

1. Guardar el archivo con el código nuevo en un .txt llamado _codigo_, sin espacios entre instrucciones.
2. Abrir el archivo Compilador2.0.py y ejecutarlo.
3. Copiar el archivo generado en la carpeta donde se encuentra el proyecto, reemplazando el codigoBin.txt existente.

