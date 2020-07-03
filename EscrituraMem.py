salida = open("MemEscritura.txt","w")

for i in range(0,65000):
    salida.write("@"+hex(i).lstrip("0x")+"\n")
    salida.write("00000000")
    salida.write("\n")
salida.close()
