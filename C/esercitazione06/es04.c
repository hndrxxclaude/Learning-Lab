/*Scrivere un programma in C che, dato un numero intero positivo n, generi una matrice quadrata di
dimensione n × n, contenente i numeri interi da 1 a n², disposti in ordine crescente a spirale in senso orario.
Il riempimento deve partire dalla cella in alto a sinistra della matrice e proseguire lungo i bordi esterni fino a
completare l’interno.*/

#include <stdio.h>

int main(void) {

    int n;

    do {
        printf("Inserisci il numero di righe della matrice quadrata (n > 0): ");
        scanf("%d", &n);
    } while (n <= 0);

    int matrice[n][n];

    int valore = 1;
    int inizioRiga = 0, fineRiga = n - 1;
    int inizioColonna = 0, fineColonna = n - 1;

    while (inizioRiga <= fineRiga && inizioColonna <= fineColonna) {
        // Riga superiore (da sinistra a destra)
        for (int j = inizioColonna; j <= fineColonna; j++) {
            matrice[inizioRiga][j] = valore++;
        }
        inizioRiga++;

        // Colonna destra (dall’alto in basso)
        for (int i = inizioRiga; i <= fineRiga; i++) {
            matrice[i][fineColonna] = valore++;
        }
        fineColonna--;

        // Riga inferiore (da destra a sinistra)
        if (inizioRiga <= fineRiga) {
            for (int j = fineColonna; j >= inizioColonna; j--)
                matrice[fineRiga][j] = valore++;
            fineRiga--;
        }

        // Colonna sinistra (dal basso all’alto)
        if (inizioColonna <= fineColonna) {
            for (int i = fineRiga; i >= inizioRiga; i--)
                matrice[i][inizioColonna] = valore++;
            inizioColonna++;
        }
    }

    // Stampa della matrice
    printf("\nMatrice %dx%d riempita a spirale:\n", n, n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%4d", matrice[i][j]);
        }
        printf("\n");
    }

    return 0;
}

    