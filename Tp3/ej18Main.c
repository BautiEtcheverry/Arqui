#include <stdio.h>

// Declaración de la función ensamblador
enum
{
    SCREEN_OK = 0,
    SCREEN_ERR = 1
};
extern int imprime_pantalla(char *encabezado, int tam_enc, char *pie, int tam_pie);

int main()
{
    char encabezado[] = "Este es el título";
    int tam_enc = 17;
    char pie[] = "Fin de mensaje";
    int tam_pie = 14;

    int res = imprime_pantalla(encabezado, tam_enc, pie, tam_pie);
    if (res == SCREEN_OK)
    {
        printf("Pantalla impresa correctamente.\n");
    }
    else
    {
        printf("Error al imprimir pantalla.\n");
    }
    return 0;
}
