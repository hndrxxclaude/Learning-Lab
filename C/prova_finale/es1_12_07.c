/* Scrivere un programma in linguaggio C che legga un file di testo contenente una matrice quadrata di
numeri interi. La prima riga del file conterrà il numero di righe e colonne della matrice; le righe successive
conterranno gli elementi della matrice.
Il programma deve accettare un parametro da riga di comando all’avvio del programma: il nome del file
contenente la matrice.
I dati contenuti nel file dovranno essere memorizzati in un array bidimensionale di interi. Una volta letti
i valori, il programma dovrà calcolare la somma degli elementi sulla diagonale principale e la somma degli
elementi sulla diagonale secondaria, e scrivere i risultati alla fine dello stesso file iniziale. */

#include <stdio.h>

void somma_diagonali(char *filename){
    FILE *fp;
    if ((fp = fopen(filename, "r")) == NULL) {
        printf("Errore in apertura del file da leggere.\n");
        return;
    }

    int size;

    fscanf(fp, "%d", &size);
    int matrice[size][size];

    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            fscanf(fp, "%d ", &matrice[i][j]);
        }
    }

    fclose(fp);

    if ((fp = fopen(filename, "a")) == NULL) {
        printf("Errore in apertura del file da scrivere.\n");
        return;
    }

    int somma_diagonale_principale = 0;
    int somma_diagonale_secondaria = 0;

    for(int i = 0; i < size; i++) {
        somma_diagonale_principale += matrice[i][i];
        somma_diagonale_secondaria += matrice[i][size-1-i];
    }

    fprintf(fp, "\nSomma sulla diagonale principale: %d\n", somma_diagonale_principale);
    fprintf(fp, "Somma sulla diagonale secondaria: %d\n", somma_diagonale_secondaria);

    fclose(fp);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Inserire in riga di comando solamente il file da leggere.\n");
        return -1;
    }
    char *filename = argv[1];

    somma_diagonali(filename);

    return 0;
}