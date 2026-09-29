/*Scrivere un programma in C che calcoli la somma dei valori elevati al quadrato di un vettore di valori double
(x₁² + x₂² + … + xₙ²), implementando una funzione che accetti come parametro l’array e la sua dimensione e
restituisca la somma dei valori al quadrato come output.*/

#include <stdio.h>

double somma_di_quadrati(double array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        array[i] *= array[i];
    }
    double totale = 0;
    for (size_t i = 0; i < size; i++) {
        totale += array[i];
    }
    return totale;
}

void inserimento_valori(double array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        printf("Inserire elemento %zu dell'array: ", i + 1);
        scanf("%lf", &array[i]);
    }
}

int main(void) {

    int dimensione;
    double totale;

    printf("Inserire la dimensione dell'array: ");
    scanf("%d", &dimensione);

    double array[dimensione];

    printf("Inserire i valori reali della quale si vuole sapere la somma di quadrati:\n");
    inserimento_valori(array, dimensione);

    totale = somma_di_quadrati(array, dimensione);

    printf("La somma di quadrati dei valori inseriti è %.2f.\n", totale);

    return 0;
} 