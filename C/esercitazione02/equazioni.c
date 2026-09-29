#include <stdio.h>

/*Risolvere equazioni del tipo ax + b = 0.*/

int main(void) {

    double a, b, x;
    
    printf("Inserire un valore per a e uno per b: \n");
    scanf("%lf%lf", &a, &b);

    x = (-b) / a;

    printf("Il valore di x per la quale l'equazione è soddisfatta è: %g\n", x);

    return 0;
}