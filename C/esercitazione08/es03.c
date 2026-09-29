/*Definire una funzione my_atoi che converta una stringa in un numero intero in base 10. Ad esempio, se viene
passata la stringa “12345” alla funzione, questa dovrà restituire l’intero 12345.
Prototipo della funzione da realizzare:
int my_atoi (const char *str);*/

#include <stdio.h>
#define SIZE 100

int my_atoi (const char *str) {
    int num = 0;
    size_t i = 0;

    while (str[i] >= '0' && str[i] <= '9') {
        num = num * 10 + (str[i] - '0');

        i++;
    }

    return num;
}

int main(void) {
    char string[SIZE];

    printf("Inserire stringa di numeri interi: ");
    scanf(" %99[^\n]", string);

    printf("Stringa iniziale: %s\n", string);

    int result = my_atoi(string);

    printf("Stringa convertita in intero: %d\n", result);

    return 0;
}