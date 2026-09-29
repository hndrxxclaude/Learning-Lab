/*Definire una funzione ricorsiva linear_search per eseguire la ricerca lineare di un elemento in un array.*/

#include <stdio.h>

#include <stdio.h>

int linear_search(int array[], int size, int c, int index) {
    if (index == size) {
        return -1; 
    }
    if (array[index] == c) {
        return index; 
    }
    return linear_search(array, size, c, index + 1);
}

int main(void) {
    int dimensione;
    printf("Inserire dimensione dell'array: ");
    scanf("%d", &dimensione);

    int array[dimensione];
    for (int i = 0; i < dimensione; i++) {
        printf("Inserire elemento %d dell'array: ", i + 1);
        scanf("%d", &array[i]);
    }

    int c;
    printf("Inserire il numero da trovare: ");
    scanf("%d", &c);
    
    int posizione = linear_search(array, dimensione, c, 0);
    if (posizione != -1) {
        printf("Numero trovato in posizione %d.\n", posizione);
    } else {
        printf("Numero non trovato.\n");
    }

    return 0;
}
