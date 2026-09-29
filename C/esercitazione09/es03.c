/*Definire una funzione ricorsiva binary_search per eseguire la ricerca binaria di un elemento in un array.
Suggerimenti:
• Prototipo della funzione da realizzare:
int binary_search(int key, int array[], int low, int high);
• Per cercare l’elemento key in un array chiamato array che ha N elementi, la chiamata di funzione dal
main potrebbe essere:
binary_search(key, array, 0, N - 1);
• Ci sono due casi base che fanno terminare la ricerca e due casi ricorsivi che la fanno continuare.*/

#include <stdio.h>

int binary_search(int key, int array[], int low, int high) {
    if (high < low) {
        return -1;
    }
    
    int middle = (low + high) / 2;
   
   if (array[middle] == key) {
        return middle; 
    } else if (key < array[middle]) {
        return binary_search(key, array, low, middle - 1); 
    } else {
        return binary_search(key, array, middle + 1, high); 
    }
}

void inserimento_valori(int array[], size_t size) {
    printf("Inserire valori: ");
    for (size_t i = 0; i < size; i++) {
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
    printf("Inserire dimensione dell'array: ");
    scanf("%d", &dimensione);

    int array[dimensione];
    inserimento_valori(array, dimensione);

    int c;
    printf("\nInserire l'elemento da cercare nell'array: ");
    scanf("%d", &c);

    int posizione = binary_search(c, array, 0, dimensione - 1);
    if (posizione != -1) {
        printf("Numero trovato in posizione %d.\n", posizione + 1);
    } else {
        printf("Numero non trovato.\n");
    }

    return 0;
}