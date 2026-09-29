/*Definire una funzione unisci_array_ordinati che, dati due array di numeri interi già ordinati e le loro
rispettive dimensioni, li fonda in un unico nuovo array ordinato.
Ad esempio, se il primo array contiene gli elementi {1, 5, 6} e il secondo contiene gli elementi {2, 4, 8, 9},
l’array risultante dovrà contenere gli elementi {1, 2, 4, 5, 6, 8, 9}, in quest’ordine.
La funzione non deve modificare gli array originari. Deve invece allocare dinamicamente un nuovo array di
dimensione adeguata e restituirlo alla fine della funzione.
Scrivere un programma C per testare la funzione realizzata.*/

#include <stdio.h>
#include <stdlib.h>

int *unisci_array_ordinati (const int array1[],const int array2[], size_t size_1, size_t size_2) {
    int *array_ordinato = malloc((size_1 * size_2) * sizeof(int));
    
    int i = 0, j = 0, k = 0;

    while (i < size_1 && j < size_2) {
        if (array1[i] < array2[j]) {
            array_ordinato[k] = array1[i];
            k++;
            i++;
        } else {
            array_ordinato[k] = array2[j];
            k++;
            j++;
        }
    }
    while ( i < size_1) {
        array_ordinato[k] = array1[i];
        k++;
        i++;
    }

    while (j < size_2) {
        array_ordinato[k] = array2[j];
        k++;
        j++;
    }

    return array_ordinato;
}

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

int main(void) {

    size_t size1, size2;

    do {
        printf("Inserire dimensione del primo array: ");
        scanf("%lu", &size1);
        printf("Inserire dimensione del secondo array: ");
        scanf("%lu", &size2);
    } while (size1 == 0 || size2 == 0);

    int *array1 = malloc(size1 * sizeof(int));
    int *array2 = malloc(size2 * sizeof(int));

    printf("Inserire valori Array 1: ");
    inserimento_valori(array1, size1);
    printf("Inserire valori Array 2: ");
    inserimento_valori(array2, size2);

    int *result = unisci_array_ordinati(array1, array2, size1, size2);

    printf("Array 1 e Array 2 uniti e ordinati: ");
    stampa_valori(result, size1 + size2);

    free(array1);
    free(array2);
    free(result);
    
    return 0;
}