/*Scrivere un programma in C che definisca due vettori A e B di uguali dimensioni e che per ciascuno di essi
chieda all’utente di inserirne i valori. Successivamente, il programma deve creare un terzo vettore Z, della
stessa dimensione di A e B, contenente nel primo elemento la somma del primo elemento di A e del primo
elemento di B; nel secondo elemento la somma del secondo elemento di A e del secondo elemento di B; e
così via.
Infine, il programma deve visualizzare tutti gli elementi di Z.*/

#include <stdio.h>
#define SIZE 5

int main(void) {

    int array_1[SIZE];
    int array_2[SIZE];
    int somma[SIZE];

    printf("Inserisci 5 numeri interi per il primo array A:\n");
    void inserimento_valori(int array[], size_t size); {
        for (size_t i = 0; i < SIZE; i++) {
            scanf("%d", &array_1[i]);
        }
    }

    printf("Inserisci 5 numeri interi per il secondo array B:\n");
    void inserimento_valori(int array_2[], size_t size); {
        for (size_t i = 0; i < SIZE; i++) {
            scanf("%d", &array_2[i]);
        }
    }

    for (int n = 0; n < SIZE; n++) {
        somma[n] = array_1[n] + array_2[n];
    }

    printf("Array A: ");
    void stampa_valori(int array_1[], size_t size); {
        for (size_t i = 0; i < SIZE; i++) {
            printf("%d ", array_1[i]);
        }
    } printf("\n");

    printf("Array B: ");
    void stampa_valori(int array_2[], size_t size); {
        for (size_t i = 0; i < SIZE; i++) {
            printf("%d ", array_2[i]);
        }
    } printf("\n");

    printf("Array Z: ");
    void stampa_valori(int somma[], size_t size); {
        for (size_t i = 0; i < SIZE; i++) {
            printf("%d ", somma[i]);
        }
    } printf("\n");

    return 0;
}