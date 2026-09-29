/*Implementare in C un programma che acquisisca un numero intero positivo N da tastiera e stampi il valore del
Suggerimento: Il fattoriale di un numero è il prodotto di tutti i numeri compresi tra 1 ed N. Inoltre, 0! = 1.*/

#include <stdio.h>

long fattoriale(int n) {
    long risultato = 1;
    for(int i = 1; i <= n; i++) {
        risultato *= i;
    } 
    return risultato;
}
int main(void) {

    int n;

    printf("Inserire il valore intero del quale si vuole conoscere il fattoriale: \n");
    scanf("%d", &n);

    if ( n < 0) {
        printf("Il valore deve essere positivo.\n");
    } else if (n == 0) {
        printf("Il fattoriale di 0 è 1.\n");
    } else {
        printf("Il fattoriale di %d è %lu\n", n, fattoriale(n));
    }
    return 0;
    
}
