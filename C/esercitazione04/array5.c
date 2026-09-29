/*Scrivere un programma in C che consenta all’utente di inserire una sequenza di numeri interi positivi in un
array. Dopo aver completato l’inserimento, il programma deve permettere all’utente di effettuare una serie di
ricerche: per ciascun valore richiesto, il programma deve indicare se quel valore è presente nella sequenza
precedentemente inserita.*/

#include <stdio.h>

#define MAX_SIZE 100

int main() {
    int array[MAX_SIZE];
    int n = 0;
    int num;

    // Inserimento dei numeri positivi
    printf("Inserisci numeri interi positivi (inserisci un numero <= 0 per terminare):\n");
    while (n < MAX_SIZE) {
        printf("Numero %d: ", n + 1);
        scanf("%d", &num);
        if (num <= 0) {
            break;
        }
        array[n] = num;
        n++;
    }

    // Fase di ricerca
    int valoreRicerca;
    char scelta;

    do {
        printf("\nInserisci un numero da cercare: ");
        scanf("%d", &valoreRicerca);

        int trovato = 0;
        for (int i = 0; i < n; i++) {
            if (array[i] == valoreRicerca) {
                trovato = 1;
                break;
            }
        }

        if (trovato) {
            printf("Il numero %d è presente nella sequenza.\n", valoreRicerca);
        } else {
            printf("Il numero %d NON è presente nella sequenza.\n", valoreRicerca);
        }

        printf("Vuoi cercare un altro numero? (s/n): ");
        scanf(" %c", &scelta);  // nota lo spazio prima di %c per ignorare newline

    } while (scelta == 's' || scelta == 'S');

    printf("Programma terminato.\n");
    return 0;
}
