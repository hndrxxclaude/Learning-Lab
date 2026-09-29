#include <stdio.h>

/*Il linguaggio C può rappresentare le lettere maiuscole, minuscole e molti altri simboli utilizzando un byte per
ogni carattere. Implementare in C un programma che visualizzi gli interi equivalenti dei seguenti simboli: A,
B, a, b, 1, 2, $, *, + e il carattere spazio.*/

int main(void){

    printf("A: %d\nB: %d\na: %d\nb: %d\n", 'A', 'B', 'a', 'b');
    printf("1: %d\n2: %d\n", '1', '2');
    printf("$: %d\n*: %d\n+: %d\nspazio: %d\n", '$', '*', '+', ' ');

    return 0;
}