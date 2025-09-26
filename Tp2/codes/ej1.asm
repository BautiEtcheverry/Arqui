section .text
GLOBAL _start

_start:
    mov ecx, cadena
    mov edx, longitud 
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

section .data
cadena db "Hola Mundo!!",10
longitud equ $-cadena

section .bss
    placeholder resb 10
