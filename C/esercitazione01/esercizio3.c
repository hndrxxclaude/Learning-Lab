#include <stdio.h>

/*Produrre il diagramma di flusso e scrivere un programma in linguaggio C che, dato il perimetro di un
quadrato, ne calcoli l’area.*/

int main(void){
    
    float perimetro, lato, area;

    printf("Inserire perimetro del quadrato in metri: \n");
    scanf("%f", &perimetro);

    lato = perimetro / 4;
    area = lato * lato;

    printf("L'area del quadrato è %f metri quadrati\n", area);

    return 0;
}