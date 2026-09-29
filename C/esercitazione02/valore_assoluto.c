#include <stdio.h>
#include <math.h>

/*Calcolare il valore assoluto di un numero in input.*/

int main(void) {
    
    float numero, valore_assoluto;

    printf("Inserire un numero del quale si vuole ottenere il valore assoluto: \n");
    scanf("%f", &numero);

    valore_assoluto = fabsf(numero);

    printf("Il valore assoluto è: %g\n", valore_assoluto);

    return 0;
}