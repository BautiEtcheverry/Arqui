; Considere una función en ASM de 32 bits denominada CheckLong. A esta función se le
; pasan dos parámetros por la pila:
;      El primer parámetro es la dirección de inicio de un vector de caracteres.
;      El segundo parámetro es un valor entero que indica la cantidad de elementos del vector de caracteres.
; 
; La función CheckLong debe recorrer el vector hasta encontrar un cero, luego compara
; con el valor siguiente al cero (el cual debería ser la cantidad de elementos del vector) y
; verifica si la cuenta es correcta comprando este número con la cuenta realizada.
; CheckLong retorna la diferencia que hubo entre el valor calculado y el valor informado.
; Es decir, si son iguales retorna cero, si el valor calculado es mayor al informado retorna la
; deferencia en valor positivo, si el valor informado es mayor, retorna la diferencia en valor
; negativo. 

GLOBAL checkLong
GLOBAL msg,len
section .data
msg: db "Hola Mundo", 0
len: db 10

section .text
checkLong:
    push ebp   ;Armado del stackFrame
    mov ebp,esp
    
    mov eax,[ebp+8]   ;Paso a eax el primer parametro, la dirección del vector de chars.
    mov esi, [ebp+12] ;Paso a ebx el segubdo paramtro, la candtida de elementos del vector.
    mov edi, 0
.loop:
    cmp BYTE [eax],0 ;48 es el ASCII del 0, comparo si el caracter del vector es un 0.
    je .done
    inc edi
    inc eax
    jmp .loop

.done:
    sub esi,edi
    mov eax,esi

    mov esp,ebp
    pop ebp
    ret