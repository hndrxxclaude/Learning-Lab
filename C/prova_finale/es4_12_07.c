/* Scrivere un programmain linguaggio C che consenta agli utenti di gestire una playlist musicale tramite
lastrutturadatidefinitanelQuesito2. Ilprogrammadeveconsentireall’utentedicompiereripetutamente
le seguenti azioni (utilizzare le funzioni, anche sfruttando quelle definite nei quesiti precedenti, senza
riscrivere il codice):
• inserire una nuova canzone nella playlist in una posizione specificata dall’utente; se l’indice è
maggiore della lunghezza della lista, impedire l’inserimento e visualizzare un messaggio di errore;
• visualizzare tutte le canzoni di un artista specificato dall’utente;
• calcolare e visualizzare la duramento totale delle canzoni di un artista specificato dall’utente;
• uscire dal programma. */

#define MAX_SIZE 100
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

typedef struct Playlist{
    char titolo_canzone[MAX_SIZE];
    char nome_artista[MAX_SIZE];
    int duramento_in_sec;
    struct Playlist *prev;
    struct Playlist *next;
} Playlist;

int durata(Playlist *head, char artista[]) {
    if (head == NULL) {
        printf("Non ci sono elementi nella lista.\n");
        return 0;
    }

    int counter = 0;

    while(head != NULL) {
        if((strcmp(head->nome_artista, artista)) == 0) {
            counter += head->duramento_in_sec;
        } 
        head = head->next;
    }

    return counter;
}


Playlist *insert_new_song(Playlist *head,char titolo[],char artista[], int duramento,int index) {
    int contanodi = 0;
    while (head != NULL) {
        contanodi++;
        head = head->next;
    }

    if (index > contanodi) {
        printf("Errore: inserire un indice minore della lunghezza della lista.\n");
        return head;
    }
    
    Playlist *new = malloc(sizeof(Playlist));
    if (new == NULL){
        printf("Errore di allocazione della memoria.\n");
        return head;
    }

    strcpy(new->titolo_canzone, titolo);
    strcpy(new->nome_artista, artista);
    new->duramento_in_sec = duramento;
    new->prev = NULL;
    new->next = NULL;

    if (head == NULL || index == 0) {
        new->next = head;
        if (head != NULL)
            head->prev = new;
        return new; 
    }

    Playlist *current = head;
    int i = 0;

    while (current->next != NULL && i < index - 1) {
        current = current->next;
        i++;
    }

    new->next = current->next;
    new->prev = current;

    if (current->next != NULL)
        current->next->prev = new;

    current->next = new;

    return head;
}

void visualizza_canzoni(Playlist *head, char artista[]) {
    int counter = 0;
    
    while(head != NULL) {
        if ((strcmp(head->nome_artista, artista)) == 0) {
            printf("Nome della Traccia: %s", head->titolo_canzone);
            counter++;
        }
        head = head->next;
    }
    if (counter == 0) {
        printf("Non ci sono canzoni dell'artista indicato all'interno della playlist.\n");
    }
}

void free_list(Playlist *head) {
    while (head != NULL) {
        Playlist *next = head->next;
        free(head);
        head = next;
    }
}

int main() {
    Playlist *head = NULL;
    int scelta, i, duramento;
    char canzone[MAX_SIZE], artista[MAX_SIZE];

    do {
        printf("\n---Menù---\n");
        printf("1: Inserire una nuova canzone nella playlist in una posizione specificata.\n");
        printf("2: Visualizzare tutte le canzoni di un artista specificato.\n");
        printf("3: Calcolare e visualizzare la duramento totale delle canzoni di un artista specificato.\n");
        printf("0: Uscire dal programma.\n");
        printf("Inserire una scelta: ");
        scanf("%d", &scelta);

        switch (scelta) {
            case 1:
                printf("Inserire la posizione in cui inserire la canzone della playlist: ");
                scanf("%d", &i);

                printf("Inserire il titolo della canzone da aggiungere: ");
                scanf(" %[^\n]", canzone);

                printf("Inserire il nome dell'artista della canzone %s: ", canzone);
                scanf(" %[^\n]", artista);

                printf("Inserire la duramento (in secondi) della canzone %s: ", canzone);
                scanf("%d", &duramento);

                head = insert_new_song(head, canzone, artista, duramento, i);
                break;
            case 2:
                printf("Inserire nome dell'artista: ");
                scanf(" %[^\n]", artista);

                visualizza_canzoni(head, artista);
                break;
            case 3:
                printf("Inserire nome dell'artista: ");
                scanf(" %[^\n]", artista);

                printf("duramento totale (in secondi) delle canzoni di %s: %d\n", artista, durata(head, artista));
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