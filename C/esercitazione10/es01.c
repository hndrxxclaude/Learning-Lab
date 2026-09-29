/*Scrivere un programma in C che chieda all’utente quanti numeri interi desidera inserire, allochi
dinamicamente un array della dimensione opportuna all’interno di una funzione e restituisca al main il
puntatore all’array creato. I valori devono essere inseriti dall’utente nella funzione di creazione dell’array.
Definire poi una seconda funzione che calcoli la somma degli elementi dell’array.
Nel main, stampare la somma calcolata e tutti i valori contenuti nell’array. Alla fine, liberare la memoria
allocata.*/

#include <stdio.h>
#include <stdlib.h>

int *creaArray(int n) {
    int *array = (int*)malloc(n * sizeof(int));

    for (int i = 0; i < n; i++) {
        printf("Inserisci l'elemento %d: ", i + 1);
        scanf("%d", &array[i]);
    }

    return array;
}

int sommaArray(int* array, int n) {
    int somma = 0;
    for (int i = 0; i < n; i++) {
        somma += array[i];
    }
    return somma;
}

int main() {
    int n;
    printf("Quanti numeri interi vuoi inserire? ");
    scanf("%d", &n);

    int *numeri = creaArray(n);

    int somma = sommaArray(numeri, n);

    printf("\nElementi dell'array:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", numeri[i]);
    }

    printf("\nSomma degli elementi: %d\n", somma);

    free(numeri);

    return 0;
}
