#include <stdio.h>

/*Implementare in C un programma che chieda all’utente di inserire il peso (Kg) e l’altezza (m) e che calcoli
l’indice di massa corporea (BMI)*/

int main(void){
    
    float peso, altezza, BMI;

    printf("Inserire peso in kilogrammi: \n");
    scanf("%f", &peso);
    printf("Inserire altezza in metri: \n");
    scanf("%f", &altezza);

    BMI = peso / (altezza * altezza);

    printf("Il BMI è: %f\n", BMI);

    return 0;
}
