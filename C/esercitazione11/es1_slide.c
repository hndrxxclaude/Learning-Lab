/*Esercizio 1
Scrivere un programma che chieda all'utente il nome di un file di testo e conti il numero di
righe presenti nel file.
Suggerimento: leggere il file un carattere alla volta e contare il numero di ritorni a capo.*/

#include <stdio.h>

int main(void) {
    FILE *fd;
    char filename[100];
    int counter = 0;
    char ch;

    printf("Inserisci il nome del file: ");
    scanf(" %[^\n]", filename);

    if ((fd = fopen(filename, "r")) == NULL) {
        printf("Errore nell'apertura del file\n");
        return -1;
        counter++;
    }

    while ((ch = fgetc(fd)) != EOF) {
        if (ch == '\n') {
            counter++;
        }
    }

    fclose(fd);

    printf("Il file '%s' contiene %d righe.\n", filename, counter + 1);

    return 0;
}
