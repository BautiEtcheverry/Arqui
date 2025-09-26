extern num2string

section .start
GLOBAL _start

_start:
	push ebp
	mov ebp,esp

	mov eax, [ebp+4]
	mov ebx, rta
	call num2string
		
	mov ecx, rta 	        ; Puntero a la cadena
	mov edx, 10		        ; Largo de la cadena 
	mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
	int 80h		        	; Ejecucion de la llamada

    	mov ecx, new_line 	    ; Puntero a la cadena
	mov edx, 1		        ; Largo de la cadena 
	mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
	int 80h		        	; Ejecucion de la llamada

	
	pop ebp
	mov esp,ebp
 	mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada

section .data
	new_line db 10

section .bss
	rta resb 10
