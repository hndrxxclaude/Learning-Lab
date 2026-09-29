#include <stdio.h>

int is_palindromo(int num, int num_cifre) {
    int flag_palindromo = 1;
    int leftmost_digit, rightmost_digit;
    int divisore = 1;

    // calcoliamo il divisore in base al numero di cifre
    for (int i = 0; i < num_cifre - 1; i++) {
        divisore = divisore * 10;
    }
    printf("divisore = %d\n", divisore);

    while (num != 0) {
        // calcoliamo la cifra più a sinistra e quella più a destra
        leftmost_digit = num / divisore;
        rightmost_digit = num % 10;
        printf("num = %d, leftmost = %d, rightmost = %d\n", num, leftmost_digit, rightmost_digit);

        if (leftmost_digit != rightmost_digit) {
            flag_palindromo = 0;
            break;
        }

        // rimuoviamo la cifra più a sinistra
        num = num % divisore;
        // rimuoviamo la cifra più a destra
        num = num / 10;

        // aggiorniamo il divisore
        divisore = divisore / 100;

        printf("nuovo num = %d, divisore = %d\n", num, divisore);
    }

    return flag_palindromo;
}


int main(void) {
    int num;
    int palindromo;
    const int num_cifre = 5;

    printf("Inserisci un numero di 5 cifre: ");
    scanf("%d", &num);

    palindromo = is_palindromo(num, num_cifre);

    if (palindromo == 1) {
        printf("Il numero %d è palindromo.\n", num);
    } else {
        printf("Il numero %d non è palindromo.\n", num);
    }

    return 0;
}
