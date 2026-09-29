/*Sia dato un numero intero positivo N inserito da tastiera. Implementare in C un programma che conti quanti
sono i divisori (con resto uguale a zero) di N. Verificare, inoltre, se N è un numero primo.
Suggerimento: [!] un numero M è divisore di un numero N se il resto della divisione N/M è uguale a zero; [!!]
un numero è primo se è divisibile solo per 1 e per se stesso.*/

#include <stdio.h>

int main(void) {
    int n, count = 0;

    // Acquisizione dell'input
    printf("Inserisci un numero intero positivo: ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("Errore: inserire un numero positivo.\n");
        return 1;
    }
    // Conta i divisori e li stampa
    for (int i = 1; i <= n; i++) {
        if (n % i == 0) {
            printf("%d ", i);
            count++;
        }
    }

    // Verifica se è un numero primo
    if (count == 2) {
        printf("\n%d è un numero primo.\n", n);
    } else {
        printf("\n%d NON è un numero primo.\n", n);
    }

    printf("Numero totale di divisori: %d\n", count);

    return 0;
}