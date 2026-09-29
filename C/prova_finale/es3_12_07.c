/* Scrivere una funzionein linguaggio C che, data una lista doppiamente concatenata di canzoni, calcoli la
durata totale delle canzoni di un artista specificato passato come parametro. La funzione deve accettare
come parametro una lista di canzoni e il nome dell’artista, e restituire la durata totale delle canzoni (in
secondi) di quell’artista. */

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

int durata(Playlist *head, char artista[]) {
    if (head == NULL) {
        printf("Non ci sono elementi nella lista.\n");
        return 0;
    }

    int counter = 0;

    while(head != NULL) {
        if((strcmp(head->nome_artista, artista)) == 0) {
            counter += head->durata_in_sec;
        } 
        head = head->next;
    }

    return counter;
}


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

int main() {
    Playlist *head = NULL;
    head = insert_new_song(head, 0, "Song A", "Artista1", 180);
    head = insert_new_song(head, 1, "Song B", "Artista2", 200);
    head = insert_new_song(head, 2, "Song C", "Artista1", 150);

    int durata_tot = durata(head, "Artista1");
    printf("Durata totale delle canzoni di Artista1: %d secondi\n", durata_tot);

    return 0;
}