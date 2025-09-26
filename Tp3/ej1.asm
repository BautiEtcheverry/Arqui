;main.asm
GLOBAL main
EXTERN printf
section .rodata
fmt db "Cantidad de argumentos: %d",10, 0
format db "%s", 10, 0
section .text
main:
 push ebp ;Armado de stack frame
 mov ebp, esp ;Ahora en ebp tengo la cantidad de argumentos
 push dword [ebp+8] ;Cargo el primer argumento
 push fmt 
 call printf
 add esp, 2*4
mov ebx, [ebp+8] ;Cargo en ebx la cantidad de argumentos
xor ecx, ecx ;Pongo en 0 el contador, lo uso como indice para moverme en el stack de a 4 bytes
mov edx, [ebp+12] ;Cargo en edx la direccion del primer argumento
.loop:
    cmp ebx,0
    je .exit
    
    pushad
    push dword [edx+ecx] ;Paso el argumento
    push format
    call printf
    add esp, 2*4 ;hago clean del stack(2 argumentos * 4 bytes)
    popad ;restauro los registros pusheados por pushad
    
    add ecx, 4
    dec ebx
    jmp .loop

.exit:
 mov eax, 0
 mov esp, ebp ;Desarmado de stack frame
 pop ebp ;
 ret 