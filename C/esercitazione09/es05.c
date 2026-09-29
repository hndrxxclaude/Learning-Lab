/*Definire una funzione ricorsiva C che, dato un array di float, restituisca il massimo valore.*/

#include <stdio.h>

void inserimento_valori(float array[], size_t size) {
    printf("Inserire valori: ");
    for (size_t i = 0; i < size; i++) {
        scanf("%f", &array[i]);
    }
}

void stampa_valori(float array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        printf("%f ", array[i]);
    }
    printf("\n");
}

float massimo(float array[], int size) {
    if (size == 1) {
        return array[0]; // Caso base: un solo elemento
    }

    float max_restante = massimo(array + 1, size - 1); // Ricorsione sull'array "ridotto"
    
    if (array[0] > max_restante) {
        return array[0];
    } else {
        return max_restante;
    }
}

int main(void) {

    int dimensione;
    printf("Inserire la dimensione dell'array: ");
    scanf("%d", &dimensione);

    float array[dimensione];
    inserimento_valori(array, dimensione);

    printf("Il massimo valore all'interno dell'array è: %g.\n", massimo(array, dimensione));

    return 0;
}