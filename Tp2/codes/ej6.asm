EXTERN num2string

GLOBAL _start

_start:

        mov eax, 1 
	mov ecx, 1 ;Contador de terminos multiplicados
.mainLoop:
        cmp ecx,[n]
        jg .done ;Si el contador(en eax) ya es >= a k termino. 
	MUL ecx
	inc ecx
	xor edx,edx
	jmp .mainLoop
	
.done:
	push eax
        mov ebx, ans
        call num2string ;Deja en eax la longdel string y en el buffer el str	

        mov edx, 12         ; Largo de la cadena 
        mov ecx, ans        ; En ans el string
        mov ebx, 1          ; FileDescriptor (STDOUT)
        mov eax, 4          ; ID del Syscall WRITE
        int 80h             ; Ejecucion de la llamada

        ;Imprimo el salto de linea
        mov ecx, new_line       ; Puntero a la cadena
        mov edx, 1              ; Largo de la cadena 
        mov ebx, 1              ; FileDescriptor (STDOUT)
        mov eax, 4              ; ID del Syscall WRITE
        int 80h                 ; Ejecucion de la llamada
	
        mov eax,1
        mov ebx,0
        int 80h

section .data
        n dd 7
        new_line db 10

section .bss
        ans resb 12
 


