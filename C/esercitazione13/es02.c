/*Si implementi il volantino digitale delle promozioni di un negozio, attraverso una lista doppiamente
concatenata. Ogni promozione consiste di un prodotto (per semplicità, una stringa che memorizza il nome
del prodotto), un prezzo in euro ed una percentuale di sconto.
L’utente può sfogliare il volantino scegliendo di andare avanti (alla promozione successiva se esiste, o alla
promozione precedente, se esiste). Inserire delle promozioni di esempio.
Il programma deve fornire le seguenti funzionalità:
1. sfogliare le promozioni nel volantino;
2. trovare la promozione con la maggior percentuale di sconto.
Quando l’utente sceglie di sfogliare le promozioni del volantino, un menù deve permettergli di scegliere tra:
1. andare avanti;
2. andare indietro;
3. tornare al menu superiore.*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define STRING_LENGTH 100

typedef struct Volantino {
    char prodotto[STRING_LENGTH];
    double prezzo;
    double sconto;
    struct Volantino *next;
    struct Volantino *prev;
} Volantino;

void sfoglia_volantino(Volantino *head);
void trova_miglior_sconto(Volantino *head);
void libera_volantino(Volantino *head);

int main(void) {
    Volantino *head = NULL;
    int scelta;

    // alcune promozioni di esempio
    Volantino *item1 = (Volantino *)malloc(sizeof(Volantino));
    strcpy(item1->prodotto, "Smartphone");
    item1->prezzo = 599.99;
    item1->sconto = 15.0;
    item1->next = NULL;
    item1->prev = NULL;
    head = item1;

    Volantino *item2 = (Volantino *)malloc(sizeof(Volantino));
    strcpy(item2->prodotto, "Televisore");
    item2->prezzo = 899.99;
    item2->sconto = 20.0;
    item2->next = NULL;
    item2->prev = item1;
    item1->next = item2;

    Volantino *item3 = (Volantino *)malloc(sizeof(Volantino));
    strcpy(item3->prodotto, "Laptop");
    item3->prezzo = 1299.99;
    item3->sconto = 25.0;
    item3->next = NULL;
    item3->prev = item2;
    item2->next = item3;

    do {
        printf("\nVolantino digitale\n");
        printf("1: Sfogliare le promozioni\n");
        printf("2: Trovare la promozione con la maggior percentuale di sconto\n");
        printf("0: Uscire dal programma\n");
        printf("Inserire una scelta: ");
        scanf("%d", &scelta);

        switch (scelta) {
            case 1:
                sfoglia_volantino(head);
                break;

            case 2:
                trova_miglior_sconto(head);
                break;

            case 0:
                printf("Uscita dal programma...\n");
                break;
                
            default:
                printf("Scelta non valida.\n");
        }
    } while (scelta != 0);
    
    libera_volantino(head);

    return 0;
}

void sfoglia_volantino(Volantino *head) {
    if (head == NULL) {
        printf("Il volantino e' vuoto.\n");
        return;
    }

    Volantino *current = head;
    int scelta;

    do {
        printf("\nPromozione corrente:\n");
        printf("Prodotto: %s\n", current->prodotto);
        printf("Prezzo: %g€\n", current->prezzo);
        printf("Sconto: %g%%\n", current->sconto);
        printf("Prezzo scontato: %g€\n", current->prezzo * (1 - current->sconto/100));

        printf("\n1: Andare avanti\n");
        printf("2: Tornare indietro\n");
        printf("3: Tornare al menù principale\n");
        printf("Inserire una scelta: ");
        scanf("%d", &scelta);

        switch(scelta) {
            case 1:
                if (current->next != NULL) {
                    current = current->next;
                } else {
                    printf("Sei alla fine del volantino.\n");
                }
                break;

            case 2:
                if (current->prev != NULL) {
                    current = current->prev;
                } else {
                    printf("Sei all'inizio del volantino.\n");
                }
                break;

            case 3:
                printf("Torno al menù principale...\n");
                break;
                
            default:
                printf("Scelta non valida.\n");
        }
    } while (scelta != 3);
}

void trova_miglior_sconto(Volantino *head) {
    if (head == NULL) {
        printf("Il volantino e' vuoto.\n");
        return;
    }

    Volantino *current = head;
    Volantino *miglior_sconto = head;

    while (current != NULL) {
        if (current->sconto > miglior_sconto->sconto) {
            miglior_sconto = current;
        }
        current = current->next;
    }

    printf("\nPromozione con il miglior sconto:\n");
    printf("Prodotto: %s\n", miglior_sconto->prodotto);
    printf("Prezzo: %g€\n", miglior_sconto->prezzo);
    printf("Sconto: %g%%\n", miglior_sconto->sconto);
    printf("Prezzo scontato: %g€\n", miglior_sconto->prezzo * (1 - miglior_sconto->sconto/100));
}

void libera_volantino(Volantino *head) {
    Volantino *current = head;
    while (current != NULL) {
        Volantino *temp = current;
        current = current->next;
        free(temp);
    }
}
