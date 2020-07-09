fuente = open("CodigoBinario.bin","r")
mif = open("CodigoBin.txt","w")
contdir = 0
while True:
    palabra = fuente.read(32)
    if not palabra: break
    #resultado = str(contdir) + " : " + palabra+";"
    if(contdir == 0):
        mif.write("@0"+"\n")
    else:
        mif.write("@"+hex(contdir).lstrip("0x")+"\n")
    mif.write(palabra+"\n")
    contdir+=1
mif.close()
