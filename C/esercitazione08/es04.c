/*Scrivere una funzione conta_positivi che accetta come parametro un array di interi e restituisce il numero di
valori maggiori di 0 presenti nell'array. Utilizzare il più possibile l'aritmetica dei puntatori. Non utilizzare la
notazione con gli indici degli array.
Prototipo della funzione da realizzare:
int conta_positivi(int *array, size_t num_elements);*/

#include <stdio.h>

int conta_positivi(int *array, size_t num_elements) {

    int positivi = 0;

    for (size_t i = 0; i < num_elements; i++) {
        if (*(array + i) > 0) {
            positivi++;
        }
    }
    return positivi;
}

int main(void) {

    int n;

    printf("Inserire dimensione dell'array: ");
    scanf("%d", &n);

    int array[n];

    printf("\nInserire valori interi nell'array: ");
    
    for (size_t i = 0; i < n; i++) {
        printf ("Inserire elemento %lu nell'array: ", i + 1);
        scanf("%d", &array[i]);
    }

    int positivi = conta_positivi(array, n);

    printf("\nSono presenti %d numeri positivi all'interno dell'array.\n", positivi);
    return 0;
}