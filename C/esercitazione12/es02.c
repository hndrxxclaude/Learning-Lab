/*Scrivere un programma per contare le occorrenze delle 26 lettere dell'alfabeto in un file di testo.
Il risultato deve essere salvato in un nuovo file chiamato frequenza_lettere.txt.
Il contenuto di frequenza_lettere.txt dovrebbe essere di questo tipo:
Occorrenze di 'a': 124
Occorrenze di 'b': 52
Occorrenze di 'c': 83
...
Suggerimento: per trasformare un carattere da maiuscolo a minuscolo si può utilizzare la funzione di libreria
tolower, dopo avere incluso l'header <ctype.h>. Esempio:
char character = 'F';
character = tolower(character); // character è diventato 'f'*/

#include <stdio.h>
#include <ctype.h>
#define MAX_SIZE 100

int main(void) {

    FILE *fd;
    FILE *out;
    char filename[MAX_SIZE];
    int occorrenze[26] = {0};
    char ch;

    printf("Inserire il nome del file del quale si vogliono conoscere le occorrenze delle lettere dell'alfabeto: ");
    scanf(" %[^\n]", filename);

     if ((fd = fopen(filename, "r")) == NULL) {
        printf("Errore nell'apertura del file\n");
        return -1;
    }

    while ((ch = fgetc(fd)) != EOF) {
        ch = tolower(ch);
        occorrenze[ch - 'a']++;
    }

    fclose(fd);

    if((out = fopen("frequenza_lettere.txt", "w")) == NULL) {
        printf("Errore nell'apertura del file.\n");
        return -1;
    }

    for (int i = 0; i < 26; i++) {
        fprintf(out, "Occorrenze di '%c': %d\n", 'a' + i, occorrenze[i]);
    }

    fclose(out);

    printf("Analisi avvenuta con successo: controllare frequenza_lettere.txt.\n");

    return 0;
}