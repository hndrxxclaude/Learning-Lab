/*Definire una funzione min_max che "restituisca" il valore minimo e il valore massimo contenuti in una
matrice.
Simulare la restituzione di due valori utilizzando i puntatori.*/

#include <stdio.h>

void min_max(size_t rows, size_t cols, int matrix[][cols], int *min, int *max) {
    *min = matrix[0][0];
    *max = matrix[0][0];
    for (size_t i = 0; i < rows; i++) {
        for(size_t j = 0; j < cols; j++) {
            if (matrix[i][j] < *min){
                *min = matrix[i][j];
            }
            if (matrix[i][j] > *max) {
                *max = matrix[i][j];
            }
        }
    }
}

int main(void) {

    int righe, colonne;
    int min, max;

    printf("Inserire le righe della matrice: ");
    scanf("%d", &righe);
    printf("Inserire colonne: ");
    scanf("%d", &colonne);

    int matrice[righe][colonne];

    for(size_t i = 0; i < righe; i++) {
        for (size_t j = 0; j < colonne; j++){
            printf("Inserire valore matrice riga %lu colonna %lu: ", i + 1, j + 1);
            scanf("%d", &matrice[i][j]);
        }
    }

    min_max(righe, colonne,matrice, &min, &max);

    printf("Il minimo è: %d.\nIl massimo è: %d\n.", min, max);

    return 0;
}

