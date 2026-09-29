/*Scrivere un programma in C che consenta all’utente di inserire 6 numeri interi in un array e poi sposti
tutti gli elementi di una posizione a sinistra.Extra: modificare il programma per permettere all’utente di specificare quante posizioni k spostare a
sinistra.

#include <stdio.h>
#define SIZE 6

int main(void) {

    int array[SIZE];
    int k;

    for (size_t i = 0; i < SIZE; i++) {
        printf("Inserire 6 valori interi:\n");
        scanf("%d", &array[i]);
    }

    printf("Di quante posizioni vuoi traslare gli elementi dell'array?\n");
    scanf("%d", &k);

    for (int i = 0; i < k; i++) {
        array[i] = array[i+k];
    }

    void stampa_valori(int array[], size_t size); {
        for (size_t i = 0; i < SIZE; i++) {
            printf("%d ", array[i]);
        }
    }
    printf("\n");

    return 0;
}*/

#include <stdio.h>

#define SIZE 6

// Funzione per stampare l'array
void stampaArray(int arr[], int size) {
    for(int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

// Funzione per ruotare l'array a sinistra di k posizioni
void ruotaSinistra(int arr[], int size, int k) {
    int temp[SIZE];
    // Calcola k modulo size per evitare rotazioni inutili
    k = k % size;

    // Copia gli elementi ruotati nell'array temporaneo
    for(int i = 0; i < size; i++) {
        temp[i] = arr[(i + k) % size];
    }

    // Copia l'array temporaneo nell'array originale
    for(int i = 0; i < size; i++) {
        arr[i] = temp[i];
    }
}

int main() {
    int arr[SIZE];
    int k;

    // Input dei 6 numeri
    printf("Inserisci 6 numeri interi:\n");
    for(int i = 0; i < SIZE; i++) {
        printf("Numero %d: ", i + 1);
        scanf("%d", &arr[i]);
    }

    // Input del numero di posizioni da ruotare
    printf("Quante posizioni vuoi ruotare a sinistra? ");
    scanf("%d", &k);

    // Ruota e stampa il risultato
    ruotaSinistra(arr, SIZE, k);
    printf("Array dopo la rotazione: ");
    stampaArray(arr, SIZE);

    return 0;
}