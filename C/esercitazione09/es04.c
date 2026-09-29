/*Definire una funzione ricorsiva C che, dati due numeri interi n e k, calcoli la somma dei primi n numeri pari
maggiori di k.*/

#include <stdio.h>

int somma_di_numeri(int n, int k) {
    if (n <= 0) {
        return 0;
    }
    if (k % 2 == 0) {
        k += 2;
        return k + somma_di_numeri(n - 1, k);
    } else {
        k += 1;
        return k + somma_di_numeri(n - 1, k);
    }
    
    
}

int main(void) {

    int n, k;
    printf("Inserire il valore di n: ");
    scanf("%d", &n);
    printf("Inserire il valore di k: ");
    scanf("%d", &k);

    int somma = somma_di_numeri(n, k);

    printf("\nLa somma dei primi %d numeri pari maggiori di %d è: %d.\n", n, k, somma);

    return 0;
}