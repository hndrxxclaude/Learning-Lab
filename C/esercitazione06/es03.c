/*Scrivere un programma in C che chieda all’utente di inserire il numero di righe n (con n > 0) di una matrice
quadrata di valori interi, chieda di inizializzarne le celle e scambi tra loro gli elementi della diagonale principale
e di quella secondaria.*/

#include <stdio.h>

int main() {
    int n;

    do {
        printf("Inserisci il numero di righe della matrice quadrata (n > 0): ");
        scanf("%d", &n);
    } while (n <= 0);

    int matrice[n][n];

    printf("Inserisci gli elementi della matrice (%dx%d):\n", n, n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("Elemento [%d][%d]: ", i, j);
            scanf("%d", &matrice[i][j]);
        }
    }

    printf("\nMatrice originale:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d", matrice[i][j]);
        }
        printf("\n");
    }

    for (int i = 0; i < n; i++) {
        int temp = matrice[i][i];
        matrice[i][i] = matrice[i][n - 1 - i];
        matrice[i][n - 1 - i] = temp;
    }

    printf("\nMatrice dopo lo scambio delle diagonali:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d", matrice[i][j]);
        }
        printf("\n");
    }

    return 0;
}
