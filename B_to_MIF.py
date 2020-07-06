fuente = open("CodigoBinario.bin","r")
mif = open("CodigoBin.txt","w")
contdir = 0
while True:
    palabra = fuente.read(32)
    if not palabra: break
    #resultado = str(contdir) + " : " + palabra+";"
    mif.write("@"+hex(contdir).lstrip("0x")+"\n")
    mif.write(palabra+"\n")
    contdir+=1
mif.close()
