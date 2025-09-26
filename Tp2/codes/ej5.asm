;Dado un número n y un valor k, imprimir todos los valores múltiplos de n desde 1 hasta k.

EXTERN print
EXTERN num2string

GLOBAL _start

_start:
	mov eax, 0
	
.mainLoop:
	cmp eax,[k]
	jg .done ;Si el contador(en eax) ya es mas >= a k termino. 
	
	;Calculo el proximo multiplo
	push eax  ;Hago backup del valor(multiplo) que esta en eax
	mov ebx, ans
	call num2string ;Deja en eax la longdel string y en el buffer el str	

	mov edx, eax 	    ; Largo de la cadena 
	mov ecx, ans	    ; En ans el string
        mov ebx, 1	    ; FileDescriptor (STDOUT)	
        mov eax, 4	    ; ID del Syscall WRITE
        int 80h		    ; Ejecucion de la llamada
	
	;Imprimo el salto de linea
	mov ecx, new_line 	; Puntero a la cadena
        mov edx, 1	        ; Largo de la cadena 
        mov ebx, 1		; FileDescriptor (STDOUT)
        mov eax, 4	        ; ID del Syscall WRITE
        int 80h		        ; Ejecucion de la llamada
	
	pop eax
	add eax, [n]
	jmp .mainLoop
.done:
	mov eax,1
	mov ebx,0
	int 80h
	
section .data
	n dd 2
	k dd 12
	new_line db 10

section .bss
	ans resb 12
 
		
