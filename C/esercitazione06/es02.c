/*Scrivere un programma in C che, date due matrici di valori interi, verifichi se sono uguali oppure no. Per
semplicità, si possono inizializzare le due matrici in-line, senza dover necessariamente chiedere i dati all’utente.*/

#include <stdio.h>

int main(void) {

    int righe, colonne;

    printf("Inserire il numero di righe e di colonne per la matrice:\n");
    
    do{
        scanf("%d%d", &righe, &colonne);
    } while(righe < 0 || colonne < 0);

    int matrice1[righe][colonne], matrice2[righe][colonne];

    printf("Inizializzare la matrice 1:\n");

    for(size_t i = 0; i < righe; i++) {
        for(size_t j = 0; j < colonne; j++){
            printf("Elemento riga %lu colonna %lu\n", i + 1, j + 1);
            scanf("%d", &matrice1[i][j]);
        }
    }

    printf("Inizializzare la matrice 2:\n");

    for(size_t i = 0; i < righe; i++) {
        for(size_t j = 0; j < colonne; j++){
            printf("Elemento riga %lu colonna %lu\n", i + 1, j + 1);
            scanf("%d", &matrice2[i][j]);
        }
    }

    int verifica = 1;

    for(size_t i = 0; i < righe; i++) {
        for(size_t j = 0; j < colonne; j++){
            if (matrice1[i][j] != matrice2[i][j]){
                verifica = 0;
            }
        }
    }

    if (verifica == 1) {
        printf("Le matrici sono uguali\n");
    } else {
        printf("Le matrici sono diverse\n");
    }

    return 0;
}
