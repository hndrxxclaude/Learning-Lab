#include <stdio.h>

/*Scambiare il valore di due variabili intere.*/

int main(void) {
    int x, y, temp;

    printf("Inserire due valori interi per x e y: \n");
    scanf("%d%d", &x, &y);

    temp = x;
    x = y;
    y = temp;

    printf("Adesso X è: %d\nY invece è: %d\n", x, y);

    return 0;
}