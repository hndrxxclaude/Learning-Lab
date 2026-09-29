#include <stdio.h>

long fattoriale(int n) {
    long risultato = 1;
    for (int i = 1; i <= n; i++) {
        risultato *= i;
    }
    return risultato;
}

int main(void) {

    int numero;

    printf("Inserire il valore del quale si vuole conoscere il fattoriale:\n");
    scanf("%d", &numero);

    if (numero < 0) {
        printf("Inserire un numero positivo.\n");
    } else if (numero == 0) {
        printf("Il fattoriale di 0 è 1.\n");
    } else {
        printf("Il fattoriale di %d è %lu.\n", numero, fattoriale(numero));
    }
    return 0;
    
}