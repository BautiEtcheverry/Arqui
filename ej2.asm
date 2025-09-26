section .text
GLOBAL _start

_start:
    mov ecx, string
    mov edx, longitud
    mov AL, [ecx]
    


    sub edx, 1

section .data 
string db "h4ppy c0d1ng",0
longitud equ $-string