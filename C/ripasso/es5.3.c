#include <stdio.h>

void stampa_floyd (int n) {
    int floyd = 1;
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= i ; j++) {
            printf("%d ", floyd);
            floyd++;
        }
        printf("\n");
    }
}

int main(void) {

    int numero;

    printf("Inserire il numero di righe del triangolo di floyd: ");
    scanf("%d", &numero);

    if (numero < 1) {
        printf("Inserire un numero di righe maggiore o pari a 1.\n");
        return 1;
    }

    stampa_floyd(numero);

    return 0;
}