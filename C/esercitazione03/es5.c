/*Implementare in C un programma che chieda all’utente di inserire un valore intero N e stampi il corrispondente
triangolo di Floyd (con N righe). Il triangolo di Floyd è un triangolo rettangolo che contiene numeri naturali,
definito riempiendo le righe del triangolo con numeri consecutivi e partendo da 1 nell’angolo in alto a sinistra.*/

#include <stdio.h>

int main() {
    int N, num = 1;

    // Acquisizione del numero di righe
    printf("Inserisci il numero di righe del Triangolo di Floyd: ");
    scanf("%d", &N);

    if (N <= 0) {
        printf("Errore: Inserire un numero positivo.\n");
        return 1;
    }

    // Creazione del triangolo
    for (int i = 1; i <= N; i++) {  // Numero di righe
        for (int j = 1; j <= i; j++) {  // Numeri nella riga
            printf("%d ", num);
            num++;  // Incremento del numero successivo
        }
        printf("\n");  // Nuova riga
    }

    return 0;
}