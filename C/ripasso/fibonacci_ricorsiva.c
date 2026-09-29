#include <stdio.h>

int fibonacci(int x) {
    if(x == 0) {
        return 0;
    } else if(x == 1) {
        return 1;
    }
    
    return fibonacci(x - 1) + fibonacci(x - 2);
}

int main(void) {
    int x;
    
    printf("Inserisci il valore di x: ");
    scanf("%d", &x);
    
    fibonacci(x);
    
    printf("Risultato: %d\n", fibonacci(x));
    
    return 0;
}
