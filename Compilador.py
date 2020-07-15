codigo = open("codigo.txt", "r")
codigoBi = open("CodigoBinario.bin", "w")
diccionarioInst = {'NOP':'00000000000000000000000000000000','lv': '00001', 'mtl': '00010', 'dvs': '00011',
                   'rest': '00100','sum': '00101', 'cp': '00110',  'b': '00111', 'beg': '01000',
                   'slr': '01001','gp': '01010', 'DONE':'01011000000000000000000000000000', 'decryption': '01100'}

diccionarioReg = {'r1': 1, 'r2': 2, 'r3': 3, 'r4': 4,
                  'r5': 5, 'r6': 6, 'r7': 7, 'r8': 8,
                  'r9': 9, 'r10': 10, 'r11': 11, 'r12': 12,
                  'r13': 13, 'r14': 14, 'r15': 15, 'r16': 16,
                  'r17': 17, 'r18': 18, 'r19': 19, 'r20': 20,
                  'r21': 21, 'r22': 22, 'r23': 23, 'r24': 24,
                  'r25': 25}
diccionarioEtiq = {}
valor = ""
contadorLineas = 0
contadorEtiquetas = 0
bflag = 0
twflag = 0
gpflag = 0
lvflag = 0
begflag = 0
countRegister = 0

    
                  
def buscar(dato):
    global bflag
    global twflag
    global countRegister
    global gpflag
    global lvflag
    global begflag
    if (dato == "b"):
        bflag = 1
    elif ((dato == "cp")or (dato == "slr")):
        twflag = 1
    elif(dato == "gp"):
        gpflag = 1
    elif(dato == "lv"):
        lvflag = 1
    elif(dato == "beg"):
        begflag = 1
    for i in diccionarioInst:
        if (i == dato):
            return diccionarioInst[i]
    
    for i in diccionarioReg:
        if (i == dato):
            if(twflag == 1):
                if(countRegister == 1):
                    twreg = str(bin(int(diccionarioReg[i]))[2:].zfill(20))
                    twflag = 0
                    countRegister = 0
                    return twreg
                else:
                    countRegister = 1
                    return str(bin(int(diccionarioReg[i]))[2:].zfill(7))
            elif(lvflag == 1):
                    lvflag = 0
                    return str(bin(int(diccionarioReg[i]))[2:].zfill(7))
            elif(begflag == 1):
                    return str(bin(int(diccionarioReg[i]))[2:].zfill(7))
            elif(gpflag == 1):
                    inmediato = str(bin(int(diccionarioReg[i]))[2:].zfill(27))
                    gpflag = 0
                    return inmediato
            else:
                return str(bin(int(diccionarioReg[i]))[2:].zfill(9))
        
    for i  in diccionarioEtiq:
        if (i == dato):
            if(bflag == 1):
                binario = str(bin(int(diccionarioEtiq[i]))[2:].zfill(27))
                bflag = 0
                return binario
            else:
                binario = str(bin(int(diccionarioEtiq[i]))[2:].zfill(13))
                return binario             
    if (dato[0] == "#"):
        inmediato = str(bin(int(dato.lstrip("#")))[2:].zfill(20))
        return inmediato
    else:
        return ""


for linea in codigo:
    contadorLineas += 1
    for palabra in linea.split():
        if(palabra[-1] == ":"):
            diccionarioEtiq[palabra.rstrip(":")] = str(contadorLineas-contadorEtiquetas-1)
            contadorEtiquetas += 1
print(diccionarioEtiq)
codigo = open("codigo.txt", "r")            
#codigo = open("Codigo.txt", "r")

for lineas in codigo:
    resultado = ""
    for palabra in lineas.split():
        if(palabra[-1]!=":"):
            codificacion = buscar(palabra)
            resultado += str(codificacion)
    if(resultado != ""):
        codigoBi.write(resultado)
        #codigoBi.write("\n")
    begflag = 0
codigoBi.close()




          
        
    

