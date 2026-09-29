#include <stdio.h>

/*Produrre il diagramma di flusso e scrivere un programma in linguaggio C che, dato un numero N, stampi il
predecessore e il successore.*/

int main(void){
    
    int numero, precedente, successivo;

    printf("Inserire un numero intero: \n");
    scanf("%d", &numero);

    precedente = numero - 1;
    successivo = numero + 1;

    printf("Il predecessore è %d, il successivo è %d\n", precedente, successivo);

    return 0;
}