#include <stdio.h>

int main(void){

    int x,y;

    printf("Inserire due valori per x e y.\n");
    scanf("%d%d", &x, &y);

    if (x == y) {
        printf("X e Y sono uguali.\n");
    } else if (x > y) {
        printf("Il massimo è x\n");
    } else {
        printf("Il massimo è y\n");
    }

    return 0;

}