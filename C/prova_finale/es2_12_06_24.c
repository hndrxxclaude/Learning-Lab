/* Definire una struttura dati per la realizzazione di una lista lineare da utilizzare per memorizzare un
inventario di prodotti. Ogni nodo della lista deve contenere il nome del prodotto, il codice del prodotto, il
prezzo di vendita e la quantità presente in magazzino. Implementare inoltre una funzione in linguaggio
C per l’inserimento in coda di un nuovo elemento nella lista. */

#define MAX_LENGTH 20
#include <stdlib.h>
#include <string.h>

typedef struct Inventario{
    char nome_prodotto[MAX_LENGTH];
    char codice[MAX_LENGTH];
    float price;
    int quantity;
    struct Inventario *next;
} Inventario;

void insert_tail(Inventario *head, char prodotto[], char code[], float prezzo, int giacenza) {
    Inventario *new = malloc(sizeof(Inventario));
    if (new == NULL) {
        printf("Errore di allocazione memoria.\n");
        return head;
    }
    strcpy(new->nome_prodotto, prodotto);
    strcpy(new->codice, code);
    new->price = prezzo;
    new->quantity = giacenza;
    new->next = NULL;

    // Se la lista è vuota, il nuovo nodo diventa la testa
    if (head == NULL) {
        return new;
    }

    while (head->next != NULL) {
        head = head->next;
    }
    head->next = new;
    
    return head;
    
}