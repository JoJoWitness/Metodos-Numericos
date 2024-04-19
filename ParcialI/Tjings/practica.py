def procesar_secuencia(fredy):
  

  print(fredy)

  tam_maria = 1
  contador = 0
  for i in range(0, len(fredy)-1):

    if contador%2 == 0 and fredy[i] > fredy[i+1]:
      tam_maria += 1  
      contador += 1
    elif contador%2 != 0 and fredy[i] < fredy[i+1]:
      tam_maria += 1
      contador += 1
    elif contador > 0:
       break
    
  return tam_maria
def main():
    try:
        with open('secuencias.in', 'r', encoding="utf-8") as file:
            num_casos = int(file.readline())
            
            with open('salida.out', 'w', encoding="utf-8") as salida:
                for _ in range(num_casos):
                    linea = file.readline().strip().split()
                    n = int(linea[0])
                    fredy = list(map(int, linea[1:]))               
                    resultado = procesar_secuencia(fredy)
                    salida.write(str(resultado) + '\n')
    
    except FileNotFoundError:
        print("¡El archivo de entrada no se encontró!")

if __name__ == "__main__":
    main()


