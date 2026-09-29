/*Definire una funzione matrice_trasposta che, ricevendo in input una matrice, il numero di righe e il numero
di colonne, allochi dinamicamente una nuova matrice che sia la trasposta della matrice originaria.
La funzione non deve modificare la matrice originaria; deve invece restituire la nuova matrice creata
all’interno della funzione.
Nella funzione main, chiedere all’utente il numero di righe e di colonne, allocare dinamicamente la matrice,
chiedere all’utente di inserire gli elementi e utilizzare la funzione matrice_trasposta.*/

#include <stdio.h>
#include <stdlib.h>

int *matrice_trasposta (int num_colonne,int *matrix, int num_righe) {
    int *trasposta = malloc(num_righe * num_colonne * sizeof(int));
    for (int i = 0; i < num_righe; i++) {
        for (int j  = 0; j < num_colonne; j++) {
            trasposta[j * num_righe + i] = matrix[i * num_colonne + j];
        }
    }
    return trasposta;
}

void inserimento_valori(size_t rows, size_t columns, int *matrix) {
    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < columns; j++) {
            printf("Inserire elemento (riga: %lu, colonna: %lu): ", i, j);
            scanf("%d", &matrix[i * columns + j]);
        }
    }
}

void stampa_valori(size_t rows, size_t columns, int *matrix) {
    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < columns; j++) {
            printf("%d\t", matrix[i * columns + j]);
        }
        printf("\n");
    }
}

int main(void) {

    int righe, colonne;
    printf("Inserire il numero di righe per la matrice: ");
    scanf("%d", &righe);
    printf("Inserire il numero di colonne per la matrice: ");
    scanf("%d", &colonne);

    int *matrice = malloc(righe * colonne * sizeof(int));
    inserimento_valori(righe, colonne, matrice);
    printf("\nMatrice prima della trasposizione:\n");
    stampa_valori(righe, colonne, matrice);

    int *trasposta = matrice_trasposta(colonne, matrice, righe);
    printf("\nMatrice dopo la trasposizione:\n");
    stampa_valori(colonne, righe, trasposta);

    free(matrice);
    free(trasposta);

    return 0;
}