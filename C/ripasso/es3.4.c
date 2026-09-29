#include <stdio.h>

void inserimento_valori(int array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        printf("Inserire elemento %zu dell'array: ", i + 1);
        scanf("%d", &array[i]);
    }
}

void calcola_valori(int array1[], int array2[], int minimi[], int massimi[], float medie[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        minimi[i] = array1[i] <= array2[i] ? array1[i] : array2[i];
        massimi[i] = array1[i] >= array2[i] ? array1[i] : array2[i];
        medie[i] = (array1[i] + array2[i]) / 2.0;
    }
}

void stampa_valori(int array[], size_t num_elementi) {
    for (size_t i = 0; i < num_elementi; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

void stampa_valori_float(float array[], size_t num_elementi) {
    for (size_t i = 0; i < num_elementi; i++) {
        printf("%g ", array[i]);
    }
    printf("\n");
}

int main(void) {

    int dimensione;

    printf("Inserire la dimensione dei due array: ");
    scanf("%d", &dimensione);

    int array1[dimensione], array2[dimensione], minimi[dimensione], massimi[dimensione];
    float medie[dimensione];

    inserimento_valori(array1, dimensione);
    inserimento_valori(array2, dimensione);

    calcola_valori(array1, array2, minimi, massimi, medie, dimensione);

    printf("Valori minimi: ");
    stampa_valori(minimi, dimensione);

    printf("Valori massimi: ");
    stampa_valori(massimi, dimensione);

    printf("Valori medi: ");
    stampa_valori_float(medie, dimensione);

    return 0;
}