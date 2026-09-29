#include <stdio.h>
#define SIZE 6

void inserimento_valori(int array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        printf("Inserire elemento %zu dell'array: ", i + 1);
        scanf("%d", &array[i]);
    }
}

int verifica_uguaglianza(int array1[], int size1, int array2[], int size2) {
    if (size1 != size2) return 0; 

    for (size_t i = 0; i < size1; i++) {
        if (array1[i] != array2[i]) {
            return 0; 
        }
    }
    return 1; 
}

int main(void) {
    int array1[SIZE], array2[SIZE];

    printf("Inserire valori per l'array 1:\n");
    inserimento_valori(array1, SIZE);
    
    printf("Inserire valori per l'array 2:\n");
    inserimento_valori(array2, SIZE);

    int uguali = verifica_uguaglianza(array1, SIZE, array2, SIZE);

    if (uguali == 1) {
        printf("Gli array sono uguali.\n");
    } else {
        printf("Gli array NON sono uguali.\n");
    }

    return 0;
}
