#include <stdio.h>

extern int checkLong(char * str, int len);

int main(int argc, char * argv[]){
    extern char msg[]; //Extern pues estan en el .asm
    extern int len;
    int msg_check_long=checkLong(msg,len);
    if(msg_check_long == 0)
        printf("Son iguales\n");
    else
        printf("La diferencia entre la longitud dada y la obtenida es: %d\n", msg_check_long);
    printf("Ahora llamo a checkLong con len 11.\n");

    msg_check_long=checkLong(msg,11);
    if(msg_check_long == 0)
        printf("Son iguales\n");
    else
        printf("La diferencia entre la longitud dada y la obtenida es: %d\n", msg_check_long);
    
        return 0;

}