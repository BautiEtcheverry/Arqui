GLOBAL close
GLOBAL exit
GLOBAL openFile
GLOBAL readFd ;Fd=File Descriptor
GLOBAL writeFd 
extern main

section .text
exit:
    mov eax, 1 
    mov ebx, [esp+4] ;Error code a retornar
    int 80h

close:
    push ebp      
    mov ebp, esp ;Aramado del stack frame

    ;and esp, -16 
    push ebx
 
    mov eax, 6        ; numero de sys_call para close
    mov ebx, [ebp+8]  ; se pasa como primer arg el FD del programa a cerrar.
    int 80h

    pop ebx
    mov esp, ebp
    pop ebp
    ret

openFile:
    push ebp      
    mov ebp, esp ;Aramado del stack frame

    and esp, -16 
    push ebx
 
    mov eax, 5        ; numero de sys_call para open
    mov ebx, [ebp+8]  ; se pasa como primer arg el path del programa a abrir.
    mov ecx, [ebp+12]  ; se pasa como segundo arg los flags del programa.
    int 80h

    pop ebx
    mov esp, ebp
    pop ebp
    ret

writeFd:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, 4 ;Codigo para syscall write
    mov ebx, [ebp+8] ;writeFd recibe como primer argumento en el stack el FD del programa.
    mov ecx, [ebp+12] ;segundo parametro, dirección al buffer con el contenido a escribir.
    mov edx, [ebp+16] ; tamaño del contenido a imprimir que se encuentra en el buffer pasado como 2ndo parametro
    int 80h
    
    pop ebx
    mov esp,ebp
    pop ebp
    ret

readFd:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, 3 ;Codigo para syscall read
    mov ebx, [ebp+8] ;writeFd recibe como primer argumento en el stack el FD del programa.
    mov ecx, [ebp+12] ;segundo parametro, dirección al buffer con el contenido a escribir.
    mov edx, [ebp+16] ; tamaño del contenido a imprimir que se encuentra en el buffer pasado como 2ndo parametro
    int 80h
    
    pop ebx
    mov esp,ebp
    pop ebp
    ret

