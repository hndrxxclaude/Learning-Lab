#include <stdio.h>

int ordine_crescente (double array[], size_t size) {
    double temp = array[0];
    for (size_t i = 1; i < size; i++){
        if (array[i] < temp) {
            return 0;
        }
        temp = array[i];
    }
    return 1;
}

void inserimento_valori(double array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        printf("Inserire elemento %zu dell'array: ", i + 1);
        scanf("%lf", &array[i]);
    }
}

int main(void) {
    
    int dimensione;

    printf("Inserire la dimensione dell'array: ");
    scanf("%d", &dimensione);

    if (dimensione <= 0) {
        printf("Inserire un valore intero maggiore o pari a 1 per la dimensione.\n");
        return 1;
    }

    double array[dimensione];

    inserimento_valori(array, dimensione);

    int crescente = ordine_crescente(array, dimensione);

    printf("Verrà visualizzato il valore 1 se gli elementi dell'array sono in ordine crescente, 0 in caso contrario:\n\n");
    printf("%d\n", crescente);

    return 0;
}