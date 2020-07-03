fuente = open("3.txt","r")
arch1 = open("Pixel1.txt","w")
arch2 = open("Pixel2.txt","w")
arch3 = open("Pixel3.txt","w")
arch4 = open("Pixel4.txt","w")
arch5 = open("Pixel5.txt","w")
arch6 = open("Pixel6.txt","w")
arch7 = open("Pixel7.txt","w")
arch8 = open("Pixel8.txt","w")
arch9 = open("Pixel9.txt","w")
arch10 = open("Pixel10.txt","w")




contdir = 0
contarchivo = 1
for pixel in fuente:
    for valor in pixel.split():
        resultado = str(bin(int(valor))[2:].zfill(8))
        if(contdir == 65000):
            contdir = 0
            contarchivo += 1
        elif(contarchivo == 1 ):
            arch1.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch1.write(resultado)
            arch1.write("\n")
            contdir+=1
        elif(contarchivo == 2 ):
            arch2.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch2.write(resultado)
            arch2.write("\n")
            contdir+=1
        elif(contarchivo == 3 ):
            arch3.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch3.write(resultado)
            arch3.write("\n")
            contdir+=1
        elif(contarchivo == 4 ):
            arch4.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch4.write(resultado)
            arch4.write("\n")
            contdir+=1
        elif(contarchivo == 5 ):
            arch5.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch5.write(resultado)
            arch5.write("\n")
            contdir+=1
        elif(contarchivo == 6 ):
            arch6.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch6.write(resultado)
            arch6.write("\n")
            contdir+=1
        elif(contarchivo == 7 ):
            arch7.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch7.write(resultado)
            arch7.write("\n")
            contdir+=1
        elif(contarchivo == 8 ):
            arch8.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch8.write(resultado)
            arch8.write("\n")
            contdir+=1
        elif(contarchivo == 9 ):
            arch9.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch9.write(resultado)
            arch9.write("\n")
            contdir+=1
        else:
            arch10.write("@"+hex(contdir).lstrip("0x")+"\n")
            arch10.write(resultado)
            arch10.write("\n")
            contdir+=1
arch1.close()
arch2.close()
arch3.close()
arch4.close()
arch5.close()
arch6.close()
arch7.close()
arch8.close()
arch9.close()
arch10.close()




































    
