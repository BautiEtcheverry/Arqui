;Escribir un programa que ordene un array de números enteros, de 4 bytes, e imprima el
;resultado ordenado por pantalla.

extern num2string
section .text
GLOBAL _start

_start:
	mov ecx, [len] ; ecx := Cantidad de elementos en el array
.outerLoop:
	mov edi, [len] ; edi := Cantidad de elementos restantes en el recorrido del array
	dec edi
	jle .printArray
	mov esi, array ; esi := Puntero al inicio del array

.orderingLoop:
	mov eax,[esi] ;Dejo en ecx el primer elemento del array 
	mov ebx, [esi+4] ;Dejo en edx el segundo elemento del array
	
	
	cmp eax,ebx
	jle .continue

.switch:
	mov [esi], ebx
	mov [esi+4], eax

.continue:
	add esi,4
	dec edi
	jnz .orderingLoop ;Si todavia quedan elementos en esta pasada, sigo con el loop

	dec ecx ;Si estoy aca es porque el loop interno ya termino y avanzo de posicion(el elemento anterior ya quedo ordenado respecto de los demas).
	jnz .outerLoop
	
.printArray:		;Ahora ya el array esta ordenado y paso a imprimirlo;
	mov esi,array
	mov ecx, [len]
	
.arrayToString:	

	mov ebx,mem
	mov eax,[esi]
	call num2string
	
	push ecx

	mov edx, eax        ; Largo de la cadena 
        mov ecx, mem        ; En mem el numero como string
        mov ebx, 1          ; FileDescriptor (STDOUT)
        mov eax, 4          ; ID del Syscall WRITE
        int 80h             ; Ejecucion de la llamada

        ;Imprimo un espacio 
        mov ecx, space       ; Puntero a la cadena
        mov edx, 1              ; Largo de la cadena 
        mov ebx, 1              ; FileDescriptor (STDOUT)
        mov eax, 4              ; ID del Syscall WRITE
        int 80h                 ; Ejecucion de la llamada
		
	pop ecx

	add esi,4 ;Avanzo a la proxima posicion del array
	dec ecx;Decremento la longitud(numeros restantes)
	jnz .arrayToString

.done:
	
        ;Imprimo un salto de linea
        mov ecx, new_line       ; Puntero a la cadena
        mov edx, 1              ; Largo de la cadena 
        mov ebx, 1              ; FileDescriptor (STDOUT)
        mov eax, 4              ; ID del Syscall WRITE
        int 80h                 ; Ejecucion de la llamada

	mov eax,1
	mov ebx,0
	int 0x80
section .data
	array dd 1,8,9,12,2,4,3,5 ; El array ordenado seria 1,2,3,4,5,8,9,12. Es una array de dd(4 Bytes : 32 bits)
	len dd ($-array)/4 ;Dejo len en cantidad de elementos y no en Bytes. 
	space db 32
	new_line db 10
section .bss
	mem resb 12

