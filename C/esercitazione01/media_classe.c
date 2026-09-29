#include <stdio.h>

int main(void) {

    int counter, totale, voto;
    float media;

    counter = 0;
    totale = 0;

    while (counter < 10) {
        
        printf("Inserire un voto da 0 a 100: \n");
        scanf("%d", &voto);

        totale = totale + voto;
        counter = counter + 1;
    }

    media = totale / 10;

    printf("La media dei voti della classe è: %g\n", media);

    return 0;
}