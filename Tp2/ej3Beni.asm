section .text
    global num2string

; Entrada: EAX = número (>=0), EBX = puntero a buffer
; Salida : EAX = longitud escrita (sin contar el NUL)

num2string:
    push ecx
    push edx
    push edi
    push esi                ; usaremos ESI

    mov edi, ebx            ; buffer destino

    ; ----- caso especial 0 -----
    test eax, eax
    jnz  .convert
    mov byte [edi], '0'
    mov byte [edi + 1], 0
    mov eax, 1
    jmp  .done

.convert:
    ; ----- contar dígitos -----
    push eax                ; guardar número original
    xor ecx, ecx            ; ECX = longitud = 0
    
.count_loop:
    test eax, eax
    je   .start_convert
    xor edx, edx
    mov esi, 10
    div esi                 ; EAX = EAX/10
    inc ecx                 ; longitud++
    jmp  .count_loop

.start_convert:
    pop eax                 ; restaurar número original
    mov esi, ecx            ; guardar longitud en ESI

    ; preparar escritura al final
    mov edi, ebx
    add edi, ecx
    mov byte [edi], 0       ; terminador NUL
    dec edi                 ; última posición de dígito

    mov ecx, 10             ; divisor fijo = 10

.digit_loop:
    xor edx, edx
    div ecx                 ; EAX = EAX/10, EDX = resto
    add dl, '0'             ; resto -> ASCII
    mov [edi], dl
    dec edi
    test eax, eax
    jnz  .digit_loop

    mov eax, esi            ; devolver longitud

.done:
    pop esi
    pop edi
    pop edx
    pop ecx
    ret
