
codigo = open("Codigo.txt", "r")
codigoBi = open("CodigoBinario.bin", "w")
diccionarioInst = {'NOP':'00000000000000000000000000000000','lv': '00001', 'mtl': '00010', 'dvs': '00011',
                   'rest': '00100','sum': '00101', 'cp': '00110',  'b': '00111', 'beg': '01000',
                   'slr': '01001','gp': '01010', 'DONE':'01011000000000000000000000000000'}

diccionarioReg = {'r1': '000000001', 'r2': '000000010', 'r3': '000000011', 'r4': '000000100',
                  'r5': '000000101', 'r6': '000000110', 'r7': '000000111', 'r8': '000001000',
                  'r9': '000001001', 'r10': '000001010', 'r11': '000001011', 'r12': '000001100',
                  'r13': '000001101', 'r14': '000001111', 'r15': '000010000', 'r16': '000010001',
                  'r17': '000010010'}
diccionarioEtiq = {}
valor = ""
contadorLineas = 0
contadorEtiquetas = 0
bflag = 0
twflag = 0

                  
def buscar(dato):
    global bflag
    global twflag
    if (dato == "b"):
        bflag = 1
    elif ((dato == "cp") or (dato == "gp") or (dato == "slr")):
        twflag = 1
    for i in diccionarioInst:
        if (i == dato):
            return diccionarioInst[i]
    
    for i in diccionarioReg:
        if (i == dato):
            if(twflag == 1):
                twreg = str(bin(int(diccionarioReg[i]))[2:].zfill(18))
                twflag = 0
                return twreg
            else: 
                return diccionarioReg[i]
        
    for i  in diccionarioEtiq:
        if (i == dato):
            if(bflag == 1):
                binario = str(bin(int(diccionarioEtiq[i]))[2:].zfill(27))
                bflag = 0
                return binario
            else:
                binario = str(bin(int(diccionarioEtiq[i]))[2:].zfill(9))
                return binario             
    if (dato[0] == "#"):
        inmediato = str(bin(int(dato.lstrip("#"),16))[2:].zfill(18))
        return inmediato
    else:
        return ""


for linea in codigo:
    contadorLineas += 1
    for palabra in linea.split():
        if(palabra[-1] == ":"):
            diccionarioEtiq[palabra.rstrip(":")] = str(contadorLineas-contadorEtiquetas)
            contadorEtiquetas += 1
            
codigo = open("Codigo.txt", "r")

for lineas in codigo:
    resultado = ""
    for palabra in lineas.split():
        if(palabra[-1]!=":"):
            codificacion = buscar(palabra)
            resultado += str(codificacion)
    if(resultado != ""):
        codigoBi.write(resultado)
        codigoBi.write("\n")
codigoBi.close()




          
        
    

