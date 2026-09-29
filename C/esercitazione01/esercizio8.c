#include <stdio.h>

/*Scrivere un programma C che stampi sullo standard output il numero di byte adottati per rappresentare i tipi
char, short, int, long, float, double. Effettuare una conversione esplicita da char a int e da double a int e
verificare la dimensione delle variabili.*/

int main(void){
    
    printf("Dimensione in byte type char: %lu\n", sizeof(char));
    printf("Dimensione in byte type int: %lu\n", sizeof(int));
    printf("Dimensione in byte type short: %lu\n", sizeof(short));
    printf("Dimensione in byte type long: %lu\n", sizeof(long int));
    printf("Dimensione in byte type float: %lu\n", sizeof(float));
    printf("Dimensione in byte type double: %lu\n", sizeof(double));

    char a = 'a';
    double b = 3.001002;
    printf("Dimensione in byte variabile a: %lu\n", sizeof(a));
    printf("Dimensione in byte variabile b: %lu\n", sizeof(b));
    
    int c = (int)(a+b);

    printf("Somma dopo la conversione: %d\n", c);
    printf("Dimensione in byte variabile c: %lu\n", sizeof(c));
    

    return 0;
}