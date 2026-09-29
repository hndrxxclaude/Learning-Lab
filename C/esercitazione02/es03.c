#include <stdio.h>

int main() {
    int a, b, c, temp;
    
    // Chiedi all'utente di inserire tre numeri interi
    printf("Inserisci tre numeri interi: ");
    scanf("%d %d %d", &a, &b, &c);
    
    // Ordinamento usando il metodo di scambio
    if (a > b) {
        temp = a;
        a = b;
        b = temp;
    }
    if (b > c) {
        temp = b;
        b = c;
        c = temp;
    }
    if (a > b) {
        temp = a;
        a = b;
        b = temp;
    }
    
    // Stampa i numeri ordinati
    printf("Numeri in ordine crescente: %d %d %d\n", a, b, c);
    
    return 0;
}
