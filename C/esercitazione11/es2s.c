/*Esercizio 2
Scrivere una funzione che permetta all’utente di memorizzare su un file la lista della spesa
e di stamparne successivamente il contenuto. Il programma dovrà chiedere di volta in volta
se l’elemento inserito è l’ultimo nella lista o meno.*/

#include <stdio.h>
#define MAX_SIZE 100

void lista_della_spesa(char filename[MAX_SIZE]) {
    FILE *fd;
    char elemento[MAX_SIZE];
    int scelta;
    
    if ((fd = fopen(filename, "w")) == NULL) {
        printf("Errore nell'apertura del file\n");
        return;
    }

    do {
        printf("Inserire elemento nella lista della spesa: ");
        scanf(" %[^\n]", elemento);
        fprintf(fd, "%s\n", elemento);
        printf("Se si desidera inserire un altro elemento inserire 1, altrimenti inserire 0: ");
        scanf("%d", &scelta);
    } while (scelta != 0);

    fclose(fd);
}

void stampa_lista(char filename[MAX_SIZE]) {
    FILE *fd;
    char riga[MAX_SIZE];

    if ((fd = fopen(filename, "r")) == NULL) {
        printf("Errore nell'apertura del file\n");
        return;
    }

    printf("\n--- Contenuto della lista della spesa ---\n");
    while (fgets(riga, MAX_SIZE, fd) != NULL) {
        printf("- %s", riga); 
    }

    fclose(fd);
}

int main(void) {

    char filename[MAX_SIZE];

    printf("Inserire il nome del file per la lista della spesa: ");
    scanf(" %[^\n]", filename);

    lista_della_spesa(filename);
    stampa_lista(filename);

    return 0;
}