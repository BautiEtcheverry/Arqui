section .text
    global _start
    extern num2string   ; nuestra función implementada

_start:
    ; ----------------------------
    ; Caso 1: EAX = 1234
    ; ----------------------------
    mov eax, 1234
    mov ebx, buffer1
    call num2string

    mov ebx, buffer1
    call print
    call newline

    ; ----------------------------
    ; Caso 2: EAX = 0
    ; ----------------------------
    mov eax, 0
    mov ebx, buffer2
    call num2string

    mov ebx, buffer2
    call print
    call newline

    ; ----------------------------
    ; Caso 3: EAX = 98765
    ; ----------------------------
    mov eax, 98765
    mov ebx, buffer3
    call num2string

    mov ebx, buffer3
    call print
    call newline

    ; Terminar
    mov eax, 1      ; syscall exit
    xor ebx, ebx
    int 0x80


; ----------------------------------
; Función: print
; Imprime el string en EBX (terminado en 0)
; ----------------------------------
print:
    pushad
    mov ecx, ebx       ; puntero al string
    mov edx, 0

.count:
    cmp byte [ecx+edx], 0
    je .done
    inc edx
    jmp .count
.done:
    mov eax, 4         ; syscall write
    mov ebx, 1         ; fd = stdout
    int 0x80
    popad
    ret

; ----------------------------------
; Función: newline
; Imprime salto de línea
; ----------------------------------
newline:
    pushad
    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 0x80
    popad
    ret


section .data
    nl db 10

section .bss
    buffer1 resb 16
    buffer2 resb 16
    buffer3 resb 16

