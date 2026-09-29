#include <stdio.h>
#define SIZE 12
#define PATTERN_SIZE 3

// Restituisce il primo indice in cui inizia il pattern.
// Se il pattern non viene trovato, restituisce -1
int cerca_pattern(int array[], size_t num_elementi, int pattern[], size_t pattern_length) {
    int indice = -1;

    for (size_t i = 0; i <= num_elementi - pattern_length; i++) {
        size_t starting_index = i;
        int caratteri_riconosciuti = 0;

        // verifichiamo quanti caratteri del pattern riusciamo a riconoscere
        for (size_t j = 0; j < pattern_length; j++) {
            if (array[starting_index + j] != pattern[j]) {
                break;
            }
            caratteri_riconosciuti++;
        }

        // se abbiamo risconosciuto tutti i caratteri del pattern, impostiamo l'indice
        if (caratteri_riconosciuti == pattern_length) {
            indice = starting_index;
            break;
        }
    }

    // se l'indice non è mai stato modificato nel for, sarà ancora -1
    return indice + 1;
}

int main(void) {
    int valori[SIZE];
    int pattern[PATTERN_SIZE];
    int indice;

    // leggiamo i valori dell'array
    printf("Inserisci %d valori: ", SIZE);
    for (size_t i = 0; i < SIZE; i++) {
        scanf("%d", &valori[i]);
    }

    // leggiamo i valori del pattern
    printf("Inserisci %d valori per il pattern: ", PATTERN_SIZE);
    for (size_t i = 0; i < PATTERN_SIZE; i++) {
        scanf("%d", &pattern[i]);
    }

    indice = cerca_pattern(valori, SIZE, pattern, PATTERN_SIZE);

    printf("Indice (-1 se non trovato): %d\n", indice);

    return 0;
}
