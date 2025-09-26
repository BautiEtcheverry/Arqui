section .text

GLOBAL _start
extern newLine 

_start:
    mov eax, 2  ; ID para llamar al fork
    xor ebx, ebx
    int 80h
    cmp eax, 0 ;Luego de un llamado a fork, en el registro EAX queda el PID del proceso hijo, por lo que si es 0 esta en el proceso hijo(el SO lo pone en 0). Si hay un error en la creacion del proceso se pone un numero de error negativo en EAX
    je .child
    
.parent:
    mov ecx, parent_msg
    mov edx, parent_len
    jmp .finish

.child:
    mov ecx, child_msg
    mov edx, child_len

.finish:
	mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
	int 80h
	call newLine
	mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada


section .data
    parent_msg db "Luke I am your father", 0
    parent_len equ $-parent_msg

    child_msg db "I am Luke", 0
    child_len equ $-child_msg

section .bss
