#include <stdio.h>
void inserimento_valori(int array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        printf("Inserire elemento %zu dell'array: ", i + 1);
        scanf("%d", &array[i]);
    }
}
void stampa_valori(int array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

int main(void) {

    int dimensione;
    int* puntadimensione=&dimensione;

    printf("L'indirizzo di dimensione è:%d", *puntadimensione);
    printf("Inserire dimensione: ");
    scanf("%d", &dimensione);

    int array[dimensione];

    inserimento_valori(array, dimensione);
    stampa_valori(array, dimensione);

    return 0;
}