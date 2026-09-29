/*Si supponga che l’utente inserisca 2 array di 6 elementi. Verificare che i due array siano uguali
elemento per elemento.*/

#include <stdio.h>
#define SIZE 6

int main(void) {
    int array_1[SIZE];
    int array_2[SIZE];

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

    int uguali = 1;
    size_t i = 0;
    while(i < SIZE && uguali == 1) {
        if (array_1[i] != array_2[i]) {
            uguali = 0;
        }
        ++i;
    }
    if (uguali == 0)
        printf("Gli array non sono uguali\n");
    else
        printf("Gli array sono uguali\n");
    
    return 0;

}
