/*Implementare in C un programma che chieda all’utente di inserire una stringa (capacità massima 100) e conti
il numero di lettere maiuscole, lettere minuscole, cifre e altri caratteri.
Suggerimento: nel codice ASCII, i gruppi di caratteri (ad esempio lettere maiuscole, oppure cifre) sono
generalmente consecutivi.*/

#include <stdio.h>
#define SIZE 100

int maiuscole(char array[]){
    int counter = 0;
    for (size_t i = 0; array[i] != '\0'; i++) {
        if (array[i] >= 65 && array[i] <= 90) {
            counter++;
        }
    }
    return counter;
}

int minuscole(char array[]){
    int counter = 0;
    for (size_t i = 0; array[i] != '\0'; i++) {
        if (array[i] >= 97 && array[i] <= 122) {
            counter++;
        }
    }
    return counter;
}

int cifre(char array[]){
    int counter = 0;
    for (size_t i = 0; array[i] != '\0'; i++) {
        if (array[i] >= 48 && array[i] <= 57) {
            counter++;
        }
    }
    return counter;
}

int altri_caratteri(char array[]){
    int counter = 0;
    for (size_t i = 0; array[i] != '\0'; i++) {
        if (0 < array[i] < 47 || 57 < array[i] < 65 || 90 < array[i] < 97 || 122 < array[i] < 255) {
            counter++;
        }
    }
    return counter;
}
int main(void) {

    char array[SIZE + 1];

    printf("Inserire stringa (max 100 caratteri): ");
    scanf("%101[^\n]", array);

    int num_maiuscole = maiuscole(array);
    int num_minuscole = minuscole(array);
    int num_cifre = cifre(array);
    int num_caratteri = altri_caratteri(array);

    return 0;
}