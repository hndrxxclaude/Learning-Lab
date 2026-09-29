/*Definire una funzione ricorsiva C che, data una stringa, restituisca la sua lunghezza.*/

#include <stdio.h>

int lunghezza_stringa(char string[]) {
    if (string[0] == '\0'){
        return 0;
    }
   return 1 + lunghezza_stringa(string + 1);
}

int main(void) {

    char str[] = "ciao";
    printf("Lunghezza: %d\n", lunghezza_stringa(str));
    return 0;
}