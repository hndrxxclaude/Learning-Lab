/* ScrivereunafunzioneinlinguaggioCche, dataunalistadiprodotti, calcoliilvaloretotaledelmagazzino
(somma delle quantità per il prezzo di ciascun prodotto). La funzione deve accettare come parametro una
lista di prodotti e restituire il valore totale del magazzino. */

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

float valore_magazzino(Inventario *head) {
    float totale = 0;
    while (head != NULL) {
        totale += head->quantity * head->price;
        head = head->next;
    }
    return totale;
}