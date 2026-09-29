/*Scrivere un programma che gestisce un array di 6 interi che rappresentano i voti di 6 studenti.
L’utente, selezionando un opportuno comando, deve poter scegliere (ripetutamente) una delle
seguenti azioni:
• inserire tutti i valori dei voti;
• stampare i voti dal primo all’ultimo;
• stampare i voti dall’ultimo al primo;
• stampare il voto massimo e minimo, indicando anche le posizioni in cui si trovano tali valori;
• stampare il voto medio.*/


#include <stdio.h>

#define NUM_STUDENTI 6

void inserisciVoti(int voti[]);
void stampaVotiOrdinati(int voti[], int ordine);
void stampaMaxMin(int voti[]);
void stampaMedia(int voti[]);

int main() {
    int voti[NUM_STUDENTI] = {0};
    int scelta;

    do {
        printf("\nMenu:\n");
        printf("1. Inserire tutti i valori dei voti\n");
        printf("2. Stampare i voti dal primo all’ultimo\n");
        printf("3. Stampare i voti dall’ultimo al primo\n");
        printf("4. Stampare il voto massimo e minimo con posizioni\n");
        printf("5. Stampare il voto medio\n");
        printf("0. Esci\n");
        printf("Scelta: ");
        scanf("%d", &scelta);

        switch (scelta) {
            case 1:
                inserisciVoti(voti);
                break;
            case 2:
                stampaVotiOrdinati(voti, 1);
                break;
            case 3:
                stampaVotiOrdinati(voti, 0);
                break;
            case 4:
                stampaMaxMin(voti);
                break;
            case 5:
                stampaMedia(voti);
                break;
            case 0:
                printf("Uscita dal programma.\n");
                break;
            default:
                printf("Scelta non valida, riprova.\n");
        }
    } while (scelta != 0);

    return 0;
}

void inserisciVoti(int voti[]) {
    printf("Inserisci i %d voti:\n", NUM_STUDENTI);
    for (int i = 0; i < NUM_STUDENTI; i++) {
        printf("Voto studente %d: ", i + 1);
        scanf("%d", &voti[i]);
    }
}

void stampaVotiOrdinati(int voti[], int ordine) {
    if (ordine) {
        printf("Voti dal primo all’ultimo: ");
        for (int i = 0; i < NUM_STUDENTI; i++) {
            printf("%d ", voti[i]);
        }
    } else {
        printf("Voti dall’ultimo al primo: ");
        for (int i = NUM_STUDENTI - 1; i >= 0; i--) {
            printf("%d ", voti[i]);
        }
    }
    printf("\n");
}

void stampaMaxMin(int voti[]) {
    int max = voti[0], min = voti[0];
    int posMax = 0, posMin = 0;
    for (int i = 1; i < NUM_STUDENTI; i++) {
        if (voti[i] > max) {
            max = voti[i];
            posMax = i;
        }
        if (voti[i] < min) {
            min = voti[i];
            posMin = i;
        }
    }
    printf("Voto massimo: %d (Posizione %d)\n", max, posMax + 1);
    printf("Voto minimo: %d (Posizione %d)\n", min, posMin + 1);
}

void stampaMedia(int voti[]) {
    int somma = 0;
    for (int i = 0; i < NUM_STUDENTI; i++) {
        somma += voti[i];
    }
    printf("Voto medio: %.2f\n", (float)somma / NUM_STUDENTI);
}
