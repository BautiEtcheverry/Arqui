#include <stdio.h>

int siete();
int main() {
    for(int i=1; i<=7; i++)
        printf("Impresión %d. La función siete() devolvió: %d\n",i, siete());
    return 0;
}