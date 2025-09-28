// Declare en una función de C, un arreglo de las siguientes formas:
//  1 Sin inicializar
//  2 Con inicialización (int numeros[20] = {0}, ó char msg[] = “mensaje”)
//  3 Sin inicializar y luego realizando una escritura en el índice 10
//  4 Con inicialización y luego realizando una escritura en el índice 10
//  5 De manera global, sin inicializar
//  6 De manera global inicializando.

// Primero suponga cómo debería hacer C para su declaración, y luego compare sus
// suposiciones con la salida en assembler. 

#include <stdio.h>

int arr4[20];
int arr5[20]={0};

int main(int argc, char *argv[]) {
    int arr1[20]; //Vector de 20 ints sin inicializar
    int arr2[20]={0}; //Vector de 20 ints inicializado en 0
    int arr3[20];
    arr3[10]=10; //Vector de 20 ints sin inicializar, luego escribo en el índice 10 con un 10.
    
    return 0;
}