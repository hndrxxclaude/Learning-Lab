/*Un palindromo è un numero o una frase di testo che, letta al contrario, rimane invariata. Ad esempio, ciascuno
dei seguenti numeri interi a cinque cifre è un palindromo: 12321, 55555, 45554 e 11611. Implementare in C un
programma che verifichi se un numero intero a 5 cifre, inserito dall’utente, è palindromo.
Suggerimento: Utilizzare la divisione e l’operatore modulo per separare il numero nelle singole cifre.*/

#include <stdio.h>

int main(void) {

    int numero, cifra1, cifra2, cifra3, cifra4, cifra5;

    printf("Inserisci un valore intero di 5 cifre: \n");
    scanf("%d", &numero);

    if (numero < 10000 || numero > 99999) {
        printf("Il valore deve essere di 5 cifre.\n");
        return 1;
    }

    cifra1 = numero / 10000;
    cifra2 = (numero / 1000) % 10;
    cifra3 = (numero / 100) % 10;
    cifra4 = (numero / 10) % 10;
    cifra5 = numero % 10;

    if (cifra1 == cifra5 && cifra2 == cifra4) {
        printf("Il numero %d è un palindromo.\n", numero);
    } else {
        printf("Il numero %d non è un palindromo.\n", numero);
    }
    return 0;
}
