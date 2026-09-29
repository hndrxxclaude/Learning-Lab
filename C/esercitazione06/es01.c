/*Scrivere un programma in C che chieda all’utente di inserire il numero di righe n e il numero di colonne m (con
n ed m > 0) di una matrice di valori interi, chieda di inizializzarne le celle e stampi il massimo, il minimo, la
somma e la media.*/

#include <stdio.h>

int main(void) {

    int righe, colonne;
    int somma = 0;
    float media;

    printf("Inserire il numero di righe e di colonne per la matrice:\n");
    
    do{
        scanf("%d%d", &righe, &colonne);
    } while(righe < 0 || colonne < 0);

    int matrice[righe][colonne];

    printf("Inizializzare la matrice:\n");

    for(size_t i = 0; i < righe; i++) {
        for(size_t j = 0; j < colonne; j++){
            printf("Elemento riga %lu colonna %lu\n", i + 1, j + 1);
            scanf("%d", &matrice[i][j]);
        }
    }

    int min = matrice[0][0];
    int max = matrice[0][0];
     
    for (size_t i = 0; i < righe; i++) {
        for (size_t j = 0; j < colonne; j++) {
            if (matrice[i][j] < min) {
                min = matrice[i][j];
            }
        }
    }

    for (size_t i = 0; i < righe; i++) {
        for (size_t j = 0; j < colonne; j++) {
            if (matrice[i][j] > max) {
                max = matrice[i][j];
            }
        }
    }

    for (size_t i = 0; i < righe; i++) {
        for ( size_t j = 0; j < colonne; j++) {
            somma += matrice[i][j];
        }
    }

    int numero_elementi = righe * colonne;

    media = somma / numero_elementi;

    printf("Il massimo è %d\n", max);
    printf("Il minimo è %d\n", min);
    printf("Il somma degli elementi della matrice è %d\n", somma);
    printf("La media è %g\n", media);

    return 0;
}