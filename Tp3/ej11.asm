; Este programa transforma una cadena de texto en minúsculas a mayúsculas.
; La función `magia` realiza la conversión de letras minúsculas a mayúsculas.
; El `main` prepara la cadena, llama a `magia` para modificarla y luego la imprime.

GLOBAL main
EXTERN printf

section .data
	fmt db "%s\n",0

section .text

main:
    push ebp
    mov ebp, esp
    and esp, -16          ; Alinear el stack a 16 bytes
    sub esp, 32           ; Reservar espacio en el stack
    mov DWORD  [esp+19], 1819043176 ; "hell" en ASCII (little-endian)
    mov DWORD  [esp+23], 1870078063 ; "o wo" en ASCII (little-endian)
    mov DWORD  [esp+27], 174353522  ; "rld!" en ASCII (little-endian)
    mov BYTE  [esp+31], 0           ; Terminador nulo
    lea eax, [esp+19]      ; Cargar la dirección de la cadena
    mov DWORD  [esp], eax
    call magia             ; Llamar a la función magia para transformar la cadena
    lea eax, [esp+19]        ; eax = pointer to string
    push eax                 ; argument: string
    push fmt                 ; argument: format string
    call printf
    add esp, 8               ; clean up stack (2 arguments * 4 bytes)
    mov ebx, 0        ; return code 0
    mov eax, 1        ; syscall number for exit
    int 0x80  

magia:
    ; Función que convierte letras minúsculas en mayúsculas.
    ; Recibe como argumento un puntero a la cadena en [ebp+8].
    push ebp
    mov ebp, esp
    sub esp, 16            ; Reservar espacio en el stack
    jmp .L4                ; Saltar al inicio del bucle

.L6:
    ; Leer el carácter actual de la cadena
    mov eax, DWORD  [ebp+8]
    movzx eax, BYTE  [eax]
    cmp al, 96             ; Comparar si el carácter es menor o igual a 'a'-1
    jle .L5                ; Si es menor o igual, saltar
    mov eax, DWORD  [ebp+8]
    movzx eax, BYTE  [eax]
    cmp al, 122            ; Comparar si el carácter es mayor a 'z'
    jg .L5                 ; Si es mayor, saltar
    ; Convertir el carácter a mayúscula
    mov eax, DWORD  [ebp+8]
    movzx eax, BYTE  [eax]
    mov BYTE  [ebp-1], al
    movzx eax, BYTE  [ebp-1]
    sub eax, 32            ; Restar 32 para convertir a mayúscula
    mov BYTE  [ebp-1], al
    mov eax, DWORD  [ebp+8]
    movzx edx, BYTE  [ebp-1]
    mov BYTE  [eax], dl ; Guardar el carácter convertido en la cadena

.L5:
    add DWORD  [ebp+8], 1 ; Avanzar al siguiente carácter

.L4:
    mov eax, DWORD  [ebp+8]
    movzx eax, BYTE  [eax]
    test al, al             ; Verificar si el carácter actual es nulo
    jne .L6                 ; Si no es nulo, continuar el bucle
    leave
    ret