section .text
    global _start
	extern newLine
_start:
    ; Llamar a nanosleep
    mov eax, 162            ; Número de syscall para nanosleep
    mov ebx, time           ; Puntero a estructura con tiempo a dormir
    mov ecx, extra_time     ; Puntero donde se almacenará tiempo restante si hay interrupción
    int 0x80                ; Realizar la llamada al sistema

        mov ecx,msg ; Puntero a la cadena
        mov edx, len                    ; Largo de la cadena 
        mov ebx, 1                      ; FileDescriptor (STDOUT)
        mov eax, 4                      ; ID del Syscall WRITE
        int 80h                         ; Ejecucion de la llamada
	call newLine

    ; Salir del programa
    mov eax, 1             ; Número de syscall para exit
    mov ebx, 0             ; Código de salida 0 (éxito)
    int 0x80               ; Realizar la llamada al sistema

section .data
; Estructura timespec para definir el tiempo de suspensión
time:
	dd 5    ; 5 segundos 
	dd 0	; 0 nanosegundos
msg db "Ya pasaron los 5 segundos"
len equ ($-msg)

section .bss
    extra_time resd 2  ; Para almacenar tiempo restante si hay interrupción
