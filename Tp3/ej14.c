#include <stdio.h>

void encrypt(char *plain, char *cipher){
    if(!(*plain)){
     *cipher = 0;
     return;
    }
    char pad = get_pad();
    *cipher = *plain + pad;
    encrypt(plain+1, cipher+1);
}

void test(){
    char *msg = "Ark";
    char cipher[] = "--------";
    cipher[4] = '0';
    encrypt(msg, cipher);
    printf(cipher);
}
int main( int argc, char * argvp[]){
    test();
    return 0;
} 

/*
🔡 Ejecución de encrypt

msg = "Ark"

Primera llamada
plain = "Ark", cipher apunta a cipher[0].
pad = 0.
*cipher = 'A' + 0 = 'A'.
Llama a encrypt("rk", cipher+1).
➝ cipher = "A---0---"

Segunda llamada
plain = "rk", cipher apunta a cipher[1].\
pad = 1.
*cipher = 'r' + 1 = 's'.
Llama a encrypt("k", cipher+1).
➝ cipher = "As--0---"

Tercera llamada
plain = "k", cipher apunta a cipher[2].
pad = 2.
*cipher = 'k' + 2 = 'm'.
Llama a encrypt("", cipher+1).
➝ cipher = "Asm-0---"

Cuarta llamada (condición base)
plain = "" → *plain == '\0'.
Entonces escribe *cipher = 0 (NULL terminator).
➝ cipher = "Asm\0 0---"

encrypt("Ark", cipher)
 └─ encrypt("rk", cipher+1)
     └─ encrypt("k", cipher+2)
         └─ encrypt("", cipher+3)   // condición base
Cuando se llega al final, la pila empieza a desapilar:
encrypt("", …) retorna, deja cipher[3] = '\0'.

encrypt("k", …) retorna (ya escribió 'm' antes).

encrypt("rk", …) retorna (ya escribió 's').

────────────────────────────────────────────
... (stack de test)
────────────────────────────────────────────
Frame encrypt("Ark", cipher)
0x0012FF7C  [EBP1+12] cipher = &cipher[0]
0x0012FF78  [EBP1+8]  plain  = &"Ark"[0]   ('A')
0x0012FF74  [EBP1+4]  return addr (a test)
0x0012FF70  [EBP1]    viejo EBP (de test)
0x0012FF6C  [EBP1-4]  pad = 0
EBP1 = 0x0012FF70
────────────────────────────────────────────
Frame encrypt("rk", cipher+1)
0x0012FF68  [EBP2+12] cipher = &cipher[1]
0x0012FF64  [EBP2+8]  plain  = &"rk"[0]    ('r')
0x0012FF60  [EBP2+4]  return addr
0x0012FF5C  [EBP2]    viejo EBP = 0x0012FF70
0x0012FF58  [EBP2-4]  pad = 1
EBP2 = 0x0012FF5C
────────────────────────────────────────────
Frame encrypt("k", cipher+2)
0x0012FF54  [EBP3+12] cipher = &cipher[2]
0x0012FF50  [EBP3+8]  plain  = &"k"[0]     ('k')
0x0012FF4C  [EBP3+4]  return addr
0x0012FF48  [EBP3]    viejo EBP = 0x0012FF5C
0x0012FF44  [EBP3-4]  pad = 2
EBP3 = 0x0012FF48
────────────────────────────────────────────
Frame encrypt("", cipher+3)  (condición base)
0x0012FF40  [EBP4+12] cipher = &cipher[3]
0x0012FF3C  [EBP4+8]  plain  = "" (apunta a '\0')
0x0012FF38  [EBP4+4]  return addr
0x0012FF34  [EBP4]    viejo EBP = 0x0012FF48
(no usa pad, entra directo al if)
EBP4 = 0x0012FF34
ESP4 = 0x0012FF34
────────────────────────────────────────────
Direcciones bajas

ERRORES:
1-cipher[] tiene 9 bytes.
msg tiene 3 caracteres.
En este caso no hay problema, pero si msg fuera más largo que cipher, habría buffer overflow.

2-Si plain nunca llega a \0, la función llama recursivamente indefinidamente, causando stack overflow.
*/