/* Definire una struttura dati per la realizzazione di una lista doppiamente concatenata da utilizzare per
memorizzare una playlist musicale. Ogni nodo della lista deve contenere il titolo della canzone, il nome
dell’artista e la durata della canzone in secondi. Implementare inoltre una funzione in linguaggio C
per l’inserimento di un nuovo elemento nella lista in una posizione specificata (indice i). Se l’indice è
maggiore della lunghezza della lista, inserire l’elemento alla fine della lista. */

#define MAX_SIZE 100
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

typedef struct Playlist{
    char titolo_canzone[MAX_SIZE];
    char nome_artista[MAX_SIZE];
    int durata_in_sec;
    struct Playlist *prev;
    struct Playlist *next;
} Playlist;

Playlist *insert_new_song(Playlist *head, int index,char titolo[],char artista[], int durata) {
    Playlist *new = malloc(sizeof(Playlist));
    if (new == NULL){
        printf("Errore di allocazione della memoria.\n");
        return head;
    }

    strcpy(new->titolo_canzone, titolo);
    strcpy(new->nome_artista, artista);
    new->durata_in_sec = durata;
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