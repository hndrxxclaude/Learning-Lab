/* Scrivere una struttura dati per la realizzazione di una lista lineare da utilizzare per memorizzare una
rubrica telefonica. Ogni nodo della lista deve contenere il nome del contatto, il numero di telefono e la
città di domicilio. Implementare inoltre in C una funzione per l’inserimento di un nuovo elemento nella
lista. */

#include <stdio.h>
#include <stdlib.h>
#define MAX_SIZE 100
#define SIZE_NUMERO 20

typedef struct Rubrica {
    char contatto[MAX_SIZE];
    int numero[SIZE_NUMERO];
    char città[MAX_SIZE];
    struct Rubrica *next;
} Rubrica;

Rubrica *inserisci(Rubrica *head) {
    Rubrica *new = NULL;
    new = malloc(sizeof(Rubrica));

    if(new == NULL) {
        printf("Errore nell'allocazione della memoria.\n");
        return head;
    } 
    printf("Inserire nome del contatto: ");
    scanf(" %[^\n]", new->contatto);

    printf("Inserire il numero: ");
    scanf(" %[^\n]", new->numero);

    printf("Inserire la città di domicilio: ");
    scanf(" %[^\n]", new->città);

    new->next = head;
    head = new;

    return head;
}