section .text

GLOBAL _start
EXTERN numtostr
EXTERN newLine

_start:

    mov eax, 0x14
    int 80h

    push buffer
    push eax
    call numtostr
    call newLine 
    pop eax
    pop eax

    mov eax, 1		; ID del Syscall EXIT
    mov ebx, 0		; Valor de Retorno
    int 80h		    ; Ejecucion de la llamada

section .data


section .bss
    buffer resb 10
