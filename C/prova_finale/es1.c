/* Scrivere un programma per cifrare un file di testo tramite il cifrario di Cesare. Il cifrario di Cesare con
chiave k, realizzato come una funzione, trasforma ogni lettera nella lettera che si trova nell’alfabeto k
posizioni più avanti. Ad esempio: cifrando la lettera ’a’ con la chiave k = 3, si ottiene: cesare(’a’, 3)
= ’d’. Il cifrario tratta l’alfabeto in maniera circolare, grazie all’operatore % che calcola il modulo; ad
esempio: cesare(’z’, 1) = ’a’. Il programma deve accettare tre parametri da riga di comando, all’avvio
del programma: i nomi di due file di testo, il primo contenente la stringa da convertire e il secondo in cui
scrivere il risultato, e il valore della chiave da utilizzare. Prevedere gli opportuni controlli che garantiscano
che la chiave abbia valori compresi tra 0 e 25. */

#include <stdio.h>
#include <stdlib.h>

void cifrario_di_cesare(char *filename_read, char *filename_write, int key);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Inserire i riga di comando 3 argomenti:\n");
        printf("1: Nome del file da leggere.\n");
        printf("2: Nome del file nel quale si vuole scrivere il risultato.\n");
        printf("3: Chiave di lettura.\n");
        return -1;
    }

    char *file_name_1 = argv[1];
    char *file_name_2 = argv[2];
    int key = atoi(argv[3]);

    if (key < 1 || key > 25) {
        printf("Inserire una chiave compresa tra 0 e 25.\n");
        return -1;
    }

    cifrario_di_cesare(file_name_1, file_name_2, key);

    return 0;
}

void cifrario_di_cesare(char *filename_read, char *filename_write, int key) {
    FILE *fp_in, *fp_out;

    if ((fp_in = fopen(filename_read, "r")) == NULL) {
        printf("Errore in apertura del file da leggere.\n");
        return;
    }

    if ((fp_out = fopen(filename_write, "w")) == NULL) {
        printf("Errore in apertura del file sul quale si desidera scrivere quale scrivere.\n");
        return;
    }    

    char ch;

    while (fscanf(fp_in, "%c", &ch) != EOF) {
         char temp = ch;
        if (ch >= 'a' && ch <= 'z') {
            ch = ((ch - 'a' + key) % 26) + 'a';
        } else if (ch <= 'A' && ch >= 'Z') {
            ch = ((ch - 'A' + key) % 26) + 'A';
        }

    fprintf(fp_out, "cesare ('%c', %d) = '%c'\n", temp, key, ch);
    }

    fclose(fp_in);
    fclose(fp_out);
    
}