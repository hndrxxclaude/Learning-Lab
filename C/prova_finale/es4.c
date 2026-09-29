/* Scrivere un programma in linguaggio C che consenta agli utenti di gestire una rubrica telefonica tramite la
struttura dati definita nel Quesito 2. Il programma deve consentire all’utente di compiere ripetutamente
le seguenti azioni (utilizzare le funzioni, anche sfruttando le funzioni definite nei quesiti precedenti, senza
riscrivere il codice):
• inserire un nuovo contatto nella rubrica; l’inserimento deve essere consentito solo se il nome del
contatto non è già presente;
• visualizzare il numero di un contatto dato il suo nome;
• visualizzare l’elenco di tutti i contatti residenti in una città specificata dall’utente. */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_SIZE 100
#define SIZE_NUMERO 20

typedef struct Rubrica {
    char contatto[MAX_SIZE];
    char numero[SIZE_NUMERO];
    char città[MAX_SIZE];
    struct Rubrica *next;
} Rubrica;

Rubrica *inserisci(Rubrica *head) {
    Rubrica *new = NULL;
    new = malloc(sizeof(Rubrica));
    Rubrica *finder = head;
    char name[MAX_SIZE];

    if(new == NULL) {
        printf("Errore nell'allocazione della memoria.\n");
        return head;
    } 

    printf("Inserire il nome del nuovo contatto: ");
    scanf(" %[^\n]", name);

    while (finder != NULL) {

        if ((strcmp(finder->contatto, name)) == 0) {
            printf("Il contatto è già presente nella rubrica.\n");
            return head;
        }

        finder = finder->next;
    }
    
    strcpy(new->contatto, name);

    printf("Inserire il numero: ");
    scanf(" %[^\n]", new->numero);

    printf("Inserire la città di domicilio: ");
    scanf(" %[^\n]", new->città);

    new->next = head;
    head = new;

    return head;
}

Rubrica *find_number(Rubrica *head, char name[]) {
    Rubrica *finder = head;
    while (finder != NULL) {

        if ((strcmp(finder->contatto, name)) == 0) {
            printf("Numero : %s\n", finder->numero);
            return finder;
        }

        finder = finder->next;
    }
    printf("Contatto non trovato in rubrica.\n");
    return NULL;
}

void elenco_residenti(Rubrica *head, char city[]) {
    Rubrica *finder = head;
    int counter = 0;
    printf("I contatti residenti a %s sono:\n", city);
    while (finder != NULL) {
        if ((strcmp(finder->città, city)) == 0) {
            printf("Nome: %s  Numero: %s\n", finder->contatto, finder->numero);
            counter++;
        }
        finder = finder->next;
    }
    if (counter == 0) {
        printf("Non ci sono contatti residenti a %s", city);
    }
}
int main(void) {
     Rubrica *head = NULL;
    int scelta;
    char nome[MAX_SIZE];
     char citta[MAX_SIZE];

    do {
        printf("\nMenù:\n");
        printf("1: Inserire un nuovo contatto nella rubrica\n");
        printf("2: Visualizzare il numero di un contatto dato il suo nome\n");
        printf("3: Visualizzare l’elenco di tutti i contatti residenti in una città specificata dall’utente\n");
        printf("0: Uscire dal programma.\n");
        printf("Inserire una scelta: ");
        scanf("%d", &scelta);

        switch(scelta) {
            case 1:
                head = inserisci(head);
                break;
            case 2:
                printf("Inserire il nome del contatto: ");
                scanf(" %[^\n]", nome);

                find_number(head, nome);
                break;
            case 3:
                printf("Inserire la città di residenza del contatto: ");
                scanf(" %[^\n]", citta);

                elenco_residenti(head, citta);
                break;
            case 0:
                printf("Uscita dal programma...\n");
                break;
            default:
                printf("Scelta non valida.\n");
        }
    } while (scelta != 0);


    return 0;
}