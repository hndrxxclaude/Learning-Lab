/* Scrivere una funzione che dati come parametri una lista, memorizzata tramite la struttura dati definita
nel Quesito 2, e una stringa, restituisca il nodo della lista il cui nome corrisponde alla stringa passata
come secondo parametro. */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_SIZE 100
#define SIZE_NUMERO 20

typedef struct Rubrica {
    char contatto[MAX_SIZE];
    int numero[SIZE_NUMERO];
    char città[MAX_SIZE];
    struct Rubrica *next;
} Rubrica;

Rubrica *return_node(Rubrica *head, char name[]) {
    Rubrica *finder = head;
    int found = 0;
    while (finder != NULL) {
        if ((strcmp(finder->contatto, name)) == 0) {
            found = 1;
            return finder;
        }
        finder = finder->next;
    }
    if(found == 0) {
        printf("Non è stato trovato nessun contatto con questo nome in rubrica.\n");
    }
    return NULL;
}