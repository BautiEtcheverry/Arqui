section .text
GLOBAL num2string

;el numero a convertir debe estar en EAX
;en EBX debe estar la direccion del buffer

;se devielve en EAX el numero pasado a string(con marca de fin 0)

num2string:
        pushad ;se pushean al stack los registron(con un orden ya definido)
	mov edi, ebx
        mov ecx,0 ;lo voy a usar para guardar la long del numero. Podria usar otro registro
        test eax,eax
        jnz .pusher
        mov byte [edi], '0' ;si edx era 0, pongo el 0
        mov byte [edi+1], 0  ; pongo la marca de fin despues del numero 0
        mov eax,1           ;dejo en EAX la longitud del numero
        jmp .done

.pusher:
	push eax
.mainLoop:
        test eax,eax ;chequeo si ya llegue al ultimo digito del numero
        je .final

        xor edx,edx
        mov esi,10
        div esi    ;dividendo EDX:EAX, divisor ESI 
        inc ecx

        jmp .mainLoop

.final:
        mov esi,ecx

        mov edi,ebx
        add edi,ecx
        mov byte [edi],0
        dec edi
        mov ecx, 10
.preDigits:
	pop eax
.digits:
        xor edx,edx
        div ecx
        add dl,'0'
        mov [edi],dl
        dec edi
        test eax,eax
        jnz .digits

        mov eax,esi
.done:
        popad
        ret


