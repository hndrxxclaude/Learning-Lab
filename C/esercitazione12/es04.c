/*Scrivere un programma che legga da file i dati di una serie di libri e individui quello con i capitoli più lunghi
(supporre che tutti i capitoli di un libro siano composti dallo stesso numero di pagine).
La prima riga del file contiene il numero di libri da leggere. Le righe successive sono composte da titolo,
autore, numero di pagine e numero di capitoli dei libri.
Il file libri.txt avrà quindi il seguente formato:
3
I Promessi Sposi,Alessandro,Manzoni,571,38
La fine dell'eternità,Isaac,Asimov,236,18
Come un romanzo,Daniel,Pennac,139,67
Definire una opportuna struct Libro che possa contenere i dati di ciascun libro.
Utilizzare un array per memorizzare i dati letti dal file e implementare una funzione
get_book_with_longest_chapters che restituisca il puntatore al libro con i capitoli più lunghi.
Prototipo della funzione da implementare:
Libro *get_book_with_longest_chapters(Libro libri[], size_t num_libri);*/

#include <stdio.h>

typedef struct {
    char nome_autore[30];
    char cognome_autore[30];
    char nome_libro[50];
    int num_pagine;
    int num_capitoli;
} Libro;

Libro *get_book_with_longest_chapters(Libro libri[], size_t num_libri) {
    Libro *migliore = &libri[0];
    double max_media = libri[0].num_pagine / libri[0].num_capitoli;

    for (size_t i = 0; i < num_libri; i++) {
        double media = libri[i].num_pagine / libri[i].num_capitoli;
        if (media > max_media) {
            max_media = media;
            migliore = &libri[i];
        }
    }
    return migliore;
}

int main(void) {

    int num_libri;
    FILE *fd = fopen("libri.txt", "r");
    if (fd == NULL) {
        printf("Errore in apertura del file.\n");
        return -1;
    }

    fscanf(fd, "%d", &num_libri);
    Libro libri[num_libri];

    for (int i = 0; i < num_libri; i++) {
        fscanf(fd, " %[^,],%[^,],%[^,],%d,%d\n", libri[i].nome_libro, libri[i].nome_autore, libri[i].cognome_autore, &libri[i].num_pagine, &libri[i].num_capitoli);
    }

    fclose(fd);

    Libro *migliore = get_book_with_longest_chapters(libri, num_libri);
    printf("Il libro con i capitoli più lunghi è:\nTitolo: %s\nAutore: %s %s\nPagine: %d\nCapitoli: %d\n", migliore->nome_libro, migliore->nome_autore, migliore->cognome_autore, migliore->num_pagine, migliore->num_capitoli);
    printf("La lunghezza media di un capitolo è: %.2f pagine\n", (double)(migliore->num_pagine / migliore->num_capitoli));

    return 0;
}