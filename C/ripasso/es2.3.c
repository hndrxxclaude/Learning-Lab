#include <stdio.h>

long fibonacci(int n) {
    if ( n == 1 || n == 2) {
        return 1;
    }
    long primo = 1, secondo = 1, successivo;
    for (int i = 3; i <= n; i++) {
        successivo = primo + secondo;
        primo = secondo;
        secondo = successivo;
    }
    return successivo;
    
}

int main(void) {

    int numeri;

    printf("Inserire i numeri di Fibonacci:\n");
    scanf("%d", &numeri);

    if (numeri <= 0) {
        printf("Inserire un valore maggiore di 0.\n");
        return 1;
    }
    printf("I primi %d numeri di Fibonacci sono:\n");
    for (int i = 1; i <= numeri; i++) {
        printf("%lu ",fibonacci(i));
    } printf("\n");

    return 0;
}