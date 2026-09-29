// Produrre il diagramma di flusso e scrivere un programma in linguaggio C che, dati due numeri, calcoli la loro
// somma, il prodotto e la media, e li stampi.

#include <stdio.h>

int main(void){
   
    float x, y, somma, prodotto, media;

    printf("Inserisci due numeri: \n");
    scanf("%f %f", &x, &y);

    somma = x + y;
    prodotto = x * y;
    media = somma / 2;

    printf("Somma: %g\nProdotto: %g\nMedia: %g\n", somma, prodotto, media);

    return 0;
}
