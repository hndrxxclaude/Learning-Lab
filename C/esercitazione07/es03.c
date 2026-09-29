/*Definire una funzione tombola che restituisca un array con i 90 numeri della tombola, estratti in ordine casuale
(senza ripetizioni).
Tenere traccia del numero di chiamate fatte alla funzione rand (incrementare un contatore ogni volta che si
chiama la funzione rand e stamparlo alla fine).
Testare il codice, scrivendo un programma C che utilizzi la funzione anche con più di 90 numeri (ad esempio
provare con 50.000 numeri).
Extra: provare a minimizzare il numero di chiamate fatte alla funzione rand, per rendere il programma più
efficiente.*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int tombola(int array[], int n) {

    int rand_calls = 0;
    // Inizializza l'array con i numeri da 1 a n
    for (int i = 0; i < n; i++) {
        array[i] = i + 1;
    }

    // Fisher-Yates shuffle
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        rand_calls++;
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    return rand_calls;
}

int main() {
    srand(time(NULL)); // Inizializza il generatore con il tempo attuale

    int n = 90;
    int array[90000]; // abbastanza grande per testare anche 50.000 numeri

    printf("Generazione di %d numeri della tombola:\n", n);
    int calls = tombola(array, n);

    // Stampa primi 10 numeri per verifica
    for (int i = 0; i < 90 && i < n; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    printf("Numero di chiamate a rand(): %d\n", calls);

    // Reset del contatore e test con 50.000
    n = 50000;
    printf("\nTest con %d numeri:\n", n);
    calls = tombola(array, n);
    printf("Numero di chiamate a rand(): %d\n",calls);

    return 0;
}
