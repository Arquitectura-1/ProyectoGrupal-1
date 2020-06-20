fuente = open("CodigoBinario.bin","r")
mif = open("CodigoMif.mif","w")

mif.write("DEPTH = 75;\n")
mif.write("WIDTH = 32; \n")
mif.write("ADDRESS_RADIX = DEC; \n")
mif.write("DATA_RADIX = BIN;  \n")
mif.write("CONTENT\n")
mif.write("BEGIN\n")

contdir = 0
while True:
    palabra = fuente.read(32)
    if not palabra: break
    resultado = str(contdir) + " : " + palabra+";"
    mif.write(resultado)
    mif.write("\n")
    contdir+=1
mif.write("END;\n")
mif.close()
