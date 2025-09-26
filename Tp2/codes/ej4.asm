EXTERN num2string
EXTERN print

section .text
GLOBAL _start
_start:
	mov eax, 18 ; Cantidad de numero naturales a sumar
	mov ebx, 0 ; Uso EBX como indice de cuantos numeros ya se sumaron
	push mem

.loop:
	cmp eax,0
	je .done
	add ebx,eax
	dec eax
	jmp .loop

.done:
        mov eax, ebx
	mov ebx,mem
	call num2string
	call print
	
	mov eax, 1              ; ID del Syscall EXIT
        mov ebx, 0              ; Valor de Retorno
        int 80h                 ; Ejecucion de la llamada
	
section .bss
	mem resb 12
