/*Implementare in C un programma che stampi i primi N numeri di Fibonacci, con N definito dall’utente. I
numeri di Fibonacci sono una sequenza di valori interi che inizia con i due valori fissi 1 e 1 e ogni successivo
valore è la somma dei due precedenti.
Esempio: I primi 10 numeri di Fibonacci sono: 1 1 2 3 5 8 13 21 34 55.*/

#include <stdio.h>

// Funzione iterativa che restituisce il n-esimo numero di Fibonacci
long fibonacci(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }

    long primo = 1, secondo = 1, successivo;
    for (int i = 3; i <= n; i++) {
        successivo = primo + secondo;
        primo = secondo;
        secondo = successivo;
    }
    return secondo;
}

int main() {
    int N;

    printf("Inserisci il numero di termini di Fibonacci da visualizzare: ");
    scanf("%d", &N);

    if (N <= 0) {
        printf("Il numero deve essere positivo.\n");
        return 1;
    }

    printf("I primi %d numeri di Fibonacci sono:\n", N);
    for (int i = 1; i <= N; i++) {
        printf("%lu ", fibonacci(i));
    }
    printf("\n");

    return 0;
}