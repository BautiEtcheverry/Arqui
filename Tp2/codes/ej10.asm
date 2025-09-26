section .text
GLOBAL _start
extern num2string
extern print

_start:
	push ebp
	mov ebp,esp
	mov ecx, [ebp+4] ;Guardo en ecx la cantidad de parametros
	dec ecx
	call printParams
	call end 
  
printParams:
	cmp ecx,0
	jle .done
	
;IMPRIMO MENSAJE
	mov ebx, argsmsg
	call print

	
;IMPRIMO LA CANTIDAD DE ARGUMENTOS
	mov eax, ecx
	mov ebx, arr
	call num2string
	mov ebx,arr
	call print
	call newLine
	
;IMPRIMO TODOS LOS ARGUMENTOS
	mov eax,0
	mov edx,12
.loop:
	cmp eax, ecx
	jge .done
	
	mov ebx, [ebp+edx]              ;Me salteo "el primer" argumento, que es el nombre del programa
	call print 		;El valor a imprimir esta en ebx
	call newLine
	add edx,4
	inc eax
	jmp .loop 	
	
.done:
	ret
newLine:
       	pushad
	mov ecx, new_line           ; Puntero a la cadena
        mov edx, 1                      ; Largo de la cadena 
        mov ebx, 1                      ; FileDescriptor (STDOUT)
        mov eax, 4                      ; ID del Syscall WRITE
        int 80h                         ; Ejecucion de la llamada
	popad
	ret

	
end:
        mov esp,ebp ;Desarmado del stackFrame
	pop ebp
        mov eax, 1              ; ID del Syscall EXIT
        mov ebx, 0              ; Valor de Retorno
        int 80h             ; Ejecucion de la llamada
section .data
	new_line db 10,0
	argsmsg db "Cantidad de argumentos: ", 0
section .bss
	arr resb 20
