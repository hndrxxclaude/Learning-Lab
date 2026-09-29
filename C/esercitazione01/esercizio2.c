#include <stdio.h>
/*Produrre il diagramma di flusso e scrivere un programma in linguaggio C che, data una misura temporale
espressa in ore, minuti e secondi, esprima la misura in termini di numero di secondi totali.*/

int main(void){
    
    int ore, minuti, secondi, secondi_totali;

    printf("Inserire ore: \n");
    scanf("%d", &ore);
    printf("Inserire minuti: \n");
    scanf("%d", &minuti);
    printf("Inserire secondi: \n");
    scanf("%d", &secondi);

    secondi_totali = (3600 * ore) + (60 * minuti) + secondi;

    printf("Secondi totali: %d\n", secondi_totali);

    return 0;
}