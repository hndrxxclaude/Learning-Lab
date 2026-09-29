/*Esercizio 3 - Selection sort
Scrivere un programma C per ordinare un array di interi.
Implementare l’algoritmo di ordinamento chiamato selection sort.
Da wikipedia:
L'algoritmo seleziona di volta in volta il numero minore nella sequenza di partenza e lo sposta nella sequenza
ordinata; di fatto la sequenza viene suddivisa in due parti: la sottosequenza ordinata, che occupa le prime
posizioni dell'array, e la sottosequenza da ordinare, che costituisce la parte restante dell'array.*/

#include <stdio.h>

void inserimento_valori(int array[], size_t size) {
    printf("Inserire valori: ");
    for (size_t i = 0; i < size; i++) {
        scanf("%d", &array[i]);
    }
}

void stampa_valori(int array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

void selectionSort(int array[], int n) {
    int i, j, minIndex, temp;

    for (i = 0; i < n - 1; i++) {
        minIndex = i;
        
        for (j = i + 1; j < n; j++) {
            if (array[j] < array[minIndex]) {
                minIndex = j;
            }
        }
        
        temp = array[i];
        array[i] = array[minIndex];
        array[minIndex] = temp;
    }
}


int main(void) {
    int dimensione;
    printf("Inserire la dimensione dell'array: ");
    scanf("%d", &dimensione);
    int array[dimensione];

    inserimento_valori(array, dimensione);
    selectionSort(array, dimensione);
    printf("Array ordinato: ");
    stampa_valori(array,dimensione);

    return 0;
}