/*
PREGUNTA:
Una forma muy fácil de arreglar este problema, es negar los últimos 4 bits. Cómo el
stack crece hacia menores valores de esp, seguro esa posición va a estar por detrás del
puntero actual. De esta forma se puede hacer un acceso a memoria más eficiente.

----------------------------------------
GLOBAL main
ALIGN 4
main:
 push ebp
 mov ebp, esp
 ;declaración de variables
 and esp, -16
 ;... programa
 mov esp, ebp
 pop ebp
 ret
 ----------------------------------------
¿Cual es la representación de -16 en hexadecimal? 
La representación de -16 en hexadecimal es: 0xFFFFFFF0
Esto es porque en complemento a dos, -16 se representa como 0xFFFFFFF0 en 32 bits.
*/

//ej2.c
#include <stdio.h>
int main(int argc, char *argv[]) {
 printf("Cantidad de argumentos %d\n", argc);
 for(int i=0; i<argc; i++){
   printf("Argumento %d: %s\n", i, argv[i]);
}
 return 0;
} 