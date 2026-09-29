/*Scrivere un programma C che gestisca un array 1D come se fosse una matrice 2D. Il programma deve
chiedere all’utente il numero di righe e di colonne e consentirgli di inserire i valori. Invece di utilizzare una
matrice, però, deve essere utilizzato un array 1D allocato dinamicamente.
Scrivere inoltre due funzioni, get_element e set_element che consentano, rispettivamente, di ottenere e di
sovrascrivere l’elemento che si trova in una specifica riga e colonna.
Prototipi delle due funzioni da realizzare:
int get_element(int array[], size_t num_colonne, size_t get_riga, size_t get_colonna);
void set_element(int value, int array[], size_t num_colonne, size_t set_riga, size_t set_colonna);*/

#include <stdio.h>
#include <stdlib.h>

int get_element(int array[], size_t num_colonne, size_t get_riga, size_t get_colonna) {
    return array[get_riga * num_colonne + get_colonna];
}

void set_element(int value, int array[], size_t num_colonne, size_t set_riga, size_t set_colonna) {
    array[set_riga * num_colonne + set_colonna] = value;
}

int main(void) {

    int righe, colonne;
    printf("Inserire il numero di righe: ");
    scanf("%d", &righe);
    printf("\nInserire il numero di colonne: ");
    scanf("%d", &colonne);

    int *array_1D = (int *)malloc(righe * colonne * sizeof(int));
    for (int i = 0; i < righe * colonne; i++) {
        printf("Inserisci l'elemento %d: ", i + 1);
        scanf("%d", &array_1D[i]);
    }

    int mod_riga, mod_colonna;

    printf("Inserire la riga dell'elemento che si vuole ottenere: ");
    scanf("%d", &mod_riga);
    printf("Inserire la colonna dell'elemento che si vuole ottenere: ");
    scanf("%d", &mod_colonna);

    int valore;
    printf("Inserire il valore da sostituire: ");
    scanf("%d", &valore);

    printf("Matrice prima della modifica: ");
    for (size_t i = 0; i < righe * colonne; i++) {
        printf("%d ", array_1D[i]);
    }
    printf("\n");

    get_element(array_1D, colonne, mod_riga, mod_colonna);
    set_element(valore,array_1D, colonne, mod_riga, mod_colonna);

    printf("Matrice dopo la modifica: ");
    for (size_t i = 0; i < righe * colonne; i++) {
        printf("%d ", array_1D[i]);
    }
    printf("\n");

    free(array_1D);

    return 0;
}