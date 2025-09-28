; ej_debug_2.asm
;===============================================================================

GLOBAL main
EXTERN puts, sprintf

section .rodata
fmt db "%d",0
number dd 1234567890

section .text
main:
     
     push dword [number] ;Se debe pushear como little endian, primero el numero o string, luego el modificador de formato 
     push fmt            ;y ultimo el buffer.
     push buffer         
     call sprintf
     add esp, 3*4 ;Esto era un and en vez de add
     push buffer
     call puts
     add esp,4
     ret

section .bss
buffer resb 40
