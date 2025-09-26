section .text

GLOBAL _start

_start:
	mov eax,0
	
.loop:
	mov bh, [text+eax] ;dejo en bh 
	cmp bh, 'a'
	jl .jmpcicle
	cmp bh, 'z'
	jg .jmpcicle	
	
	add bh, 'A'
	sub bh, 'a' ; la diferencia entre las mayusculas y minusculas es cte, entonce le sumo esa diferencia haciendo +'A'-'a'
	mov [text+eax], bh 

.jmpcicle:
	add eax,1
	cmp eax,length
	jl .loop ;si todavia quedan caracteres para analizar vuelvo a llamar a loop
.meme: 
	mov ecx,text
	mov edx,length
        mov ebx,1 ;fileDescriptor
        mov eax,4 ;syscall de write
        int 80h

        mov eax, 1
        mov ebx,0
        int 80h

section .data

	text db "h4ppy c0d1ng",10
	length equ $-text

