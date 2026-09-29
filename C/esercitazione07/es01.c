/*Per i seguenti punti, si implementino due versioni: la prima utilizzando le funzioni di string.h, la seconda
senza utilizzarle.
a) Implementare una funzione per la copia di una stringa in un’altra.
b) Implementare una funzione per concatenare due stringhe.
c) Implementare una funzione che, date due stringhe, le confronti per verificare quale delle due precede
l’altra in ordine alfabetico: restituire 0 se le due stringhe sono uguali, -1 se la prima stringa precede la
seconda, 1 altrimenti.*/

#include <stdio.h>
#include <string.h>
#define SIZE 100

void copia_array(char array1[], char array2[], char dest[]) {
    size_t i;

    // Copia array1 in dest
    for (i = 0; array1[i] != '\0'; i++) {
        dest[i] = array1[i];
    }
    dest[i] = '\0';

    // Sovrascrive array1 con array2
    for (i = 0; array2[i] != '\0'; i++) {
        array1[i] = array2[i];
    }
    array1[i] = '\0';

    printf("Stringa 1: %s\n", array1);
    printf("Stringa 2: %s\n", array2);
}


void concatena_array(char array1[], char array2[], char concatenato[]) {
    int i = 0;
    int j = 0;
    
    while (array1[i] != '\0') {
        concatenato[i] = array1[i];
        i++;
    }

    while (array2[j] != '\0') {
        concatenato[i] = array2[j];
        j++;
        i++;
    }

    concatenato[i] = '\0';

    printf("Stringhe concatenate: %s\n", concatenato);
}


int confronto_alfabetico(char array1[], char array2[]) {
    for (size_t i = 0; array1[i] != '\0' || array2[i] != '\0'; i++) {
        if (array1[i] < array2[i]) return -1;
        if (array1[i] > array2[i]) return 1;
    }
    return 0;
} 


int main(void) {

    char s1[SIZE + 1], s2[SIZE + 1], dest[SIZE + 1], concatenato[SIZE * 2];
    
    printf("Inserire la stringa 1: ");
    scanf("%100[^\n]", s1);
    printf("Inserire la stringa 2: ");
    scanf(" %100[^\n]", s2);

    copia_array(s1, s2, dest);
    concatena_array(dest, s2, concatenato);
    int risultato = confronto_alfabetico(dest, s2);
    printf("Verrà visualizzato 0 se le due stringhe sono uguali, -1 se la prima stringa precede la seconda, 1 altrimenti.\n");
    printf("\n%d\n", risultato);
    

    return 0;
}