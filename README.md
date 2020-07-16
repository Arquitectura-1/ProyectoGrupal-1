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
2. Abrir el .qof desde Quartus y compilar el proyecto para luego programar la FPGA.
3. Si desea simularlo, debe compilar el proyecto desde Modelsim, una vez compilado, abrir el vga_tb y ejecutar la simulación.

