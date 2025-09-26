extern num2string

section .text
GLOBAL _start

_start:
	push ebp   ;Armado del stackFrame
	mov ebp,esp;

	mov eax,[len] ;Guardo la longitud del "array" 
	mov ecx , array ;@Coloco en ebx la direccion del primer elemento del array
	
	
.getMin:
	mov edx,[ecx] ;Tomo el primer elemento del array
	dec eax
	;EN EDX VA A ESTAR EL MINIMO
.loop:
	cmp eax,0
	jle .done
	add ecx,4 ;Adelanto el array
	mov ebx,[ecx] ;Guardo el nuevo primer elemento del array
	dec eax

	cmp edx, ebx ;Comparo el minimo con el nuevo elemnto
	jg .nuevoMin
	jmp .loop

.nuevoMin:
	mov edx,ebx 
	jmp .loop
	

.done:

	mov ebx, ans
	mov eax,edx ;Muevo a eax el MINIMO que estaba en EDX
	call num2string

	mov edx, eax        ; Largo de la cadena 
        mov ecx,ans  ; En ans el numero
        mov ebx, 1          ; FileDescriptor (STDOUT)   
        mov eax, 4          ; ID del Syscall WRITE
        int 80h             ; Ejecucion de la llamada

        ;Imprimo el salto de linea
        mov ecx, new_line       ; Puntero a la cadena
        mov edx, 1              ; Largo de la cadena 
        mov ebx, 1              ; FileDescriptor (STDOUT)
        mov eax, 4              ; ID del Syscall WRITE
        int 80h                 ; Ejecucion de la llamada

	mov esp,ebp
	pop ebp
.exit:
	mov eax,1
        mov ebx,0
        int 80h

section .data 

	array dd 21,34,55,89,144,4,233,377,610,987 ;Array de dd(4 Bytes-32bits)
	len dd ($-array)/4 ;Me guardo la longitud del array 
	new_line db 10
section .bss
	ans resb 4
