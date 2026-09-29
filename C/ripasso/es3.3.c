#include <stdio.h>

int divisori (int n) {
    float resto;
    int counter = 0;

    for (int i = 1; i <= n; i++) {
        resto = n % i;
        if (resto == 0) {
            counter++;
        }
    } return counter;
}

int main(void) {

    int numero, counter;


    printf("Inserire numero intero:\n");
    scanf("%d", &numero);

    counter = divisori(numero);

    if (counter == 2) {
        printf("%d è un numero primo\n", numero);
    }  else {
        printf("%d NON è un numero primo\n", numero);
    }
    printf("I divisori di %d sono %d.\n", numero, divisori(numero));

    printf("I divisori di %d sono: ", numero);
    for (int i = 1; i <= numero; i++) {
        if (numero % i == 0) {
            printf("%d ", i);
        }
    } printf("\n");
    
    return 0;
}