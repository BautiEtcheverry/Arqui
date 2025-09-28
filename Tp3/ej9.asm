;Escriba un programa que imprima por salida estándar el fabricante del procesador.

; La instrucción CPUID en assembler es una instrucción de los procesadores Intel/AMD (x86/x86-64) que permite consultar 
; información sobre la CPU y sus características.
; No realiza cálculos, sino que devuelve datos de identificación y capacidades del procesador en los registros generales.

; Antes de ejecutar CPUID, se carga un valor en el registro EAX (a veces también ECX) que indica qué información se quiere consultar.
;     EAX=0 → Vendor ID string y número máximo de funciones estándar.
;     EAX=1 → Versión del procesador, familia, modelo, stepping, y flags de características (MMX, SSE, AVX, etc.).
;     EAX=2 → Información sobre cachés y TLB.
;     EAX=7 → Extensiones adicionales (BMI, AVX2, SHA, etc.).
;     EAX=0x80000000 → Número máximo de funciones extendidas soportadas.
;     EAX=0x80000002 a 0x80000004 → Nombre de la CPU en ASCII (ej: "Intel(R) Core(TM)...").
; Registros de salida
;     EAX: valores principales (ej. familia/modelo).
;     EBX, ECX, EDX: banderas o cadenas de texto según la función pedida.

; obs: Llamanado a cpuid con EAX en 0 se devuelve en EBX, EDX, ECX una cadena ASCII de 12 caracteres con el Vendor ID del procesador.
; El orden es:
;     EBX = primeros 4 caracteres
;     EDX = siguientes 4 caracteres
;     ECX = últimos 4 caracteres

GLOBAL _start

section .text

_start:
    mov eax,0
    cpuid
    mov [manufacturerData], ebx
    mov [manufacturerData+4], edx
    mov [manufacturerData+8], ecx
    mov byte [manufacturerData+12],0

    ;Imprimo mensaje default(definido en section .data)
    mov eax, 4          ; syscall number for write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg     ; pointer to message
    mov edx, msg_len ; message length
    int 80h

    ;Imprimo la información devuelta por cpuid(guardada en el buffer)
    mov eax,4
    mov ebx,1
    mov ecx, manufacturerData
    mov edx,16
    int 80h
    
    ;Imprimo un salto de linea
    mov eax,4
    mov ebx,1
    mov ecx, new_line
    mov edx,1
    int 80h

    ;Exit
    mov eax, 1          ; syscall de exit
    xor ebx, ebx        ; exit code 0
    int 80h

section .data
msg db "Fabricante del CPU:"
msg_len equ $-msg
new_line db 10

section .bss
manufacturerData resb 16 ;Buffer
