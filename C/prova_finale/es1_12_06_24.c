/* Scrivere un programma in linguaggio C che legga un file di testo contenente un elenco di parole (una
per riga), conti il numero di occorrenze di ogni parola e scriva il risultato in un altro file di testo. Il
programma deve accettare due parametri da riga di comando all’avvio del programma: il nome del file
di input contenente le parole e il nome del file di output in cui scrivere il conteggio delle parole.
Il file di output dovrà contenere una parola e il rispettivo conteggio per ogni riga.
Per semplicità, si consideri che nel file di input ci possano essere, al più, 100 parole diverse, e che ogni
parola sia lunga, al massimo, 50 caratteri. */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <string.h>
#define MAX_WORDS 100
#define MAX_LENGTH 50

void conta_occorrenze(char *file_input, char *file_output) {
    FILE *fp_in, *fp_out;

    fp_in = fopen(file_input, "r");
    if (fp_in == NULL) {
        printf("Errore in apertura del file da leggere.\n");
        return;
    }


    char ch;
    int num_righe = 0;

    while ((fscanf(fp_in, "%c", &ch)) != EOF) {
        if (ch == '\n') {
            num_righe++;
        }
    }

    rewind(fp_in);

    char matrice[num_righe][MAX_LENGTH];

    for (int i = 0; i < num_righe; i++) {
        fscanf(fp_in, " %[^\n]", matrice[i]);
    }

    fclose(fp_in);

    char parole[MAX_WORDS][MAX_LENGTH];
    int counter[MAX_WORDS] = {0};
    int parole_trovate = 0;

    for (int i = 0; i < num_righe; i++) {
        int found = 0;
        for (int j = 0; j < parole_trovate; j++) {
            if (strcmp(matrice[i], parole[j]) == 0) {
                counter[j]++;
                found = 1;
                break;
            }
        }
        if (found == 0 && parole_trovate < MAX_WORDS) {
            strcpy(parole[parole_trovate], matrice[i]);
            counter[parole_trovate] = 1;
            parole_trovate++;
        }
    }

    fp_out = fopen(file_output, "w");
    if (fp_out == NULL) {
        printf("Errore in apertura del file di scrittura.\n");
        return;
    }

    for (int i = 0; i < parole_trovate; i++) {
        fprintf(fp_out, "%s: %d\n", parole[i], counter[i]);
    }

    fclose(fp_out); // chiude file di output
    printf("Conteggio completato. Risultato scritto in '%s'.\n", file_output);
}


int main(int argc, char *argv[]) {

     if (argc != 3) {
        printf("Uso corretto: %s <file_input> <file_output>\n", argv[0]);
        return 1; // errore: numero errato di argomenti
    }

    // argv[1] è il nome del file di input
    // argv[2] è il nome del file di output
    conta_occorrenze(argv[1], argv[2]);
}