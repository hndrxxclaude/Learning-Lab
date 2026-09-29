/* Scrivere un programma in linguaggio C che consenta agli utenti di gestire un inventario di negozio
tramite la struttura dati definita nel Quesito 2. Il programma deve consentire all’utente di compiere ripe-
tutamente le seguenti azioni (utilizzare le funzioni, anche sfruttando quelle definite nei quesiti precedenti,
senza riscrivere il codice):
• inserire un nuovo prodotto nell’inventario, in coda alla lista; l’inserimento deve essere consentito
solo se il codice del prodotto non è già presente;
• visualizzare il prodotto con la quantità maggiore;
• visualizzare tutti i prodotti con prezzo inferiore a un valore specificato dall’utente;
• uscire dal programma. */

#include <stdio.h>
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

Inventario *insert_tail(Inventario *head, char prodotto[], char code[], float prezzo, int giacenza) {
   Inventario *check = head;
    while (check != NULL) {
        if (strcmp(code, check->codice) == 0) {
            printf("Il prodotto è già presente nell'inventario.\n");
            return head;
        }
        check = check->next;
    }

    Inventario *new = malloc(sizeof(Inventario));
    if (new == NULL) {
        printf("Errore nell'allocazione della memoria.\n");
        return head;
    }
    
    strcpy(new->nome_prodotto, prodotto);
    strcpy(new->codice, code);
    new->price = prezzo;
    new->quantity = giacenza;

    if (head == NULL) {
        return new;
    }

    Inventario *temp = head;
    while (temp->next != NULL) {
    temp = temp->next;
    }
    temp->next = new;
    new->next = NULL;

    return head;
    
}

void quantità_maggiore(Inventario *head) {

    if (head == NULL) {
        printf("Non sono ancora presenti elementi nella lista.\n");
        return;
    }
    char prodotto_q_m[MAX_LENGTH];
    int giacenza = head->quantity;
    strcpy(prodotto_q_m, head->nome_prodotto);
    head = head->next;

    while(head != NULL) {
        if (head->quantity > giacenza) {
            strcpy(prodotto_q_m, head->nome_prodotto);
            giacenza = head->quantity;
        }
        head = head->next;
    }

    printf("Il prodotto presente nell'inventario in quantità maggiore è: %s.\nLa giacenza è di %d pezzi.\n", prodotto_q_m, giacenza);

}

void inferiore_al_prezzo(Inventario *head, float prezzo) {
   if (head == NULL) {
        printf("Non sono ancora presenti elementi nella lista.\n");
        return;
    }

    int counter = 0;

    while (head != NULL) {
        if(head->price < prezzo) {
            printf("%s: %.2f\n", head->nome_prodotto, head->price);
            counter++;
        }
        head = head->next;
    }
    if (counter == 0) {
        printf("Non ci sono articoli con prezzo inferiore al prezzo indicato.\n");
    }
}

int main(void) {
    Inventario *head = NULL;

    char prodotto[MAX_LENGTH];
    char codice[MAX_LENGTH];
    float prezzo;
    int giacenza;

    int scelta;

    do {
        printf("\n---Menù---\n");
        printf("1: Inserire un nuovo prodotto nell’inventario.\n");
        printf("2: Visualizzare il prodotto con la quantità maggiore.\n");
        printf("3: Visualizzare tutti i prodotti con prezzo inferiore a un valore specificato.\n");
        printf("0: Uscire dal programma.\n");
        scanf("%d", &scelta);

        switch(scelta) {
            case 1:
                printf("Inserire nome del prodotto: ");
                scanf(" %[^\n]", prodotto);
                printf("Inserire il codice del prodotto: ");
                scanf(" %[^\n]", codice);
                printf("Inserire il prezzo: ");
                scanf("%f", &prezzo);
                printf("Inserire la quantità: ");
                scanf("%d", &giacenza);

                head = insert_tail(head, prodotto, codice, prezzo, giacenza);

                break;
            
            case 2: 
                quantità_maggiore(head);
                break;

            case 3:
                printf("Inserire il prezzo: ");
                scanf("%f", &prezzo);

                inferiore_al_prezzo(head, prezzo);
                break;

            case 0:
                printf("Uscita dal programma...\n");
                break;;
            
            default: 
                printf("Scelta non valida.\n");
        }
    } while (scelta != 0);

    // Libera memoria
    while (head != NULL) {
        Inventario *temp = head;
        head = head->next;
        free(temp);
    }

    return 0;
}