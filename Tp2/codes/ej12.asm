section .text
GLOBAL _start
extern print
extern newLine

_start:
	mov ecx,0
	
.loop:
	add ecx,4
	mov ebx,[esp+ecx]
	cmp ebx, 0
	je .loop
	call print
	call newLine
	jmp .loop

	mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada
