/*Si supponga che l’utente inserisca due array. Creare altri tre array in modo tale che essi contengano i
valori minimi, massimi e medi degli elementi di posizione corrispondente e stamparne i valori.*/

#include <stdio.h>
#define SIZE 3

int main(void) {

    int array_1[SIZE];
    int array_2[SIZE];
    int minimi[SIZE];
    int massimi[SIZE];
    float medie[SIZE];

    printf("Inserisci sei elementi interi per il primo array:\n");
    for (int i = 0; i < SIZE; i++) {
        printf("Elemento %d:", i + 1);
        scanf("%d", &array_1[i]);
    }
 
    printf("Inserisci sei elementi interi per il secondo array:\n");
    for (int i = 0; i < SIZE; i++) {
        printf("Elemento %d:", i + 1);
        scanf("%d", &array_2[i]);
    }

    for (int i = 0; i < SIZE; i++) {
        if (array_1[i] > array_2[i]) {
            minimi[i] = array_2[i];
        } else {
            minimi[i] = array_1[i];
        }
    }
    printf("Minimi = ");
    size_t i = 0;
        printf("{%d, %d, %d}\n", minimi[i], minimi[i+1], minimi[i+2]);

    for (int i = 0; i < SIZE; i++) {
        if (array_1[i] > array_2[i]) {
             massimi[i] = array_1[i];
        } else {
            massimi[i] = array_2[i];
        }
    }
    printf("Massimi = ");
        printf("{%d, %d, %d}\n", massimi[i], massimi[i+1], massimi[i+2]);

    for (int i = 0; i < SIZE; i++) {
        medie[i] = (array_1[i] + array_2[i]) / 2.0;
    }
    printf("Medie = {%.2f, %.2f, %.2f}\n", medie[i], medie[i+1], medie[i+2]);

}