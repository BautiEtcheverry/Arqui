;main.asm
GLOBAL main
EXTERN puts, sprintf
section .rodata
fmt db "%d", 0
number dd 123456790
section .text
main:
 push dword [number]
 push fmt
 push buffer
 call sprintf
 add esp, 3*4
 push buffer
 call puts
 add esp, 4
 ret
section .bss
buffer resb 40 

/*
Razón: sprintf recibe 3 parámetros:

buffer (destino)
fmt (formato "%d")
[number] (valor 123456790)
En la convención de llamada cdecl, el caller (quien llama) es responsable de limpiar el stack después de la llamada. Como se pasaron 3 parámetros de 4 bytes cada uno = 12 bytes totales.

Después de puts - se suma 4 bytes
Razón: puts recibe 1 parámetro:

buffer (string a imprimir)
Por tanto, solo necesita limpiar 4 bytes del stack.
*/