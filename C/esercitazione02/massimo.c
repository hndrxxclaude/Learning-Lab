#include <stdio.h>

/*Calcolare il massimo valore tra 3 numeri in input.*/

int main(void) {

    double n1, n2, n3, massimo;

    printf("Inserire 3 numeri: \n");
    if(scanf("%lf%lf%lf", &n1, &n2, &n3) != 3) {
        printf("Errore: inserire 3 numeri validi.\n");
        return 1;
    };

    if(n1 == n2 && n2 == n3) {
        printf("I tre numeri sono uguali\n");
        return 0;
    }

    if(n1 > n2) {
        if(n1 > n3) {
            massimo = n1;
        } else {
            massimo = n3;
        } 
    } else if(n2 > n3) {
        massimo = n2;
    } else {
        massimo = n3;
    }

    printf("Il massimo fra i 3 numeri forniti è: %g\n", massimo);

    return 0;
}