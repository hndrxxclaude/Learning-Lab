/*Scrivere un programma in C che permetta di cercare una sequenza di numeri interi (pattern) senza salti
all’interno di una sequenza di numeri più lunga, anch’essa inserita da tastiera. Il programma deve restituire la
posizione del primo elemento della sequenza principale a partire dalla quale compare il pattern, se presente.
Esempio: pattern = 1, 2, 3; sequenza = 0, 21, 4, 1, 2, 4, 5, 1, 2, 3, 15, 9. Restituisce 7.*/

#include <stdio.h>

int main(void) {
    int n, m, i, j, found;

    // Inserimento della lunghezza della sequenza principale
    printf("Inserisci la lunghezza della sequenza principale: ");
    scanf("%d", &n);

    int sequenza[n];
    printf("Inserisci la sequenza principale (%d numeri):\n", n);
    for (i = 0; i < n; i++) {
        scanf("%d", &sequenza[i]);
    }

    // Inserimento della lunghezza del pattern da cercare
    printf("Inserisci la lunghezza del pattern: ");
    scanf("%d", &m);

    int pattern[m];
    printf("Inserisci il pattern (%d numeri):\n", m);
    for (i = 0; i < m; i++) {
        scanf("%d", &pattern[i]);
    }

    // Ricerca del pattern nella sequenza
    for (i = 0; i <= n - m; i++) {
        found = 1;  // assumiamo che il pattern sia presente
        for (j = 0; j < m; j++) {
            if (sequenza[i + j] != pattern[j]) {
                found = 0;  // non corrisponde
                break;
            }
        }
        if (found) {
            printf("Pattern trovato a partire dalla posizione %d.\n", i + 1); // posizione a partire da 1
            return 0;
        }
    }

    printf("Pattern non trovato nella sequenza.\n");
    return 0;
}