GLOBAL _start
extern main ;Funcion de C que dejara en eax su valor de retorno.
extern printf

section .text

_start:

    mov eax, 0x4    ;Hacemos un print para chequear que estamos en este codigo.
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    int 80h

    ;Primero, paso por stack los parametros a main, siendo estos argc y argv
    mov eax, [esp]      ; argc
    lea ebx, [esp+4]    ; argv
    push ebx            ; argv
    push eax            ; argc
    call main  ;main recibe los dos parametros pusheados, como lo determina su header: int main(int argc, char *argv[])
    add esp, 2*4

    push  eax ;Cargo el primer argumento
    push mainRetMsg 
    call printf
    add esp,8


    mov ebx, eax    ;Le paso lo que retorna main al exit
    mov eax, 1      ;Syscall de exit
    int 80h

section .data
msg db "Guía 3 - Ejercicio 7", 10, 0
len equ $-msg
mainRetMsg db "El main de c devolvió:%d",10, 0
