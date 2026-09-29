/*Implementare in C un programma che chieda all’utente di inserire un carattere minuscolo e dica se esso è una
vocale o una consonante.
Extra: ripetere l’esercizio per rendere il programma non case-sensitive. In altre parole, l’utente può inserire un
carattere maiuscolo o minuscolo ed ottenere lo stesso risultato.*/

#include <stdio.h>
#include <ctype.h>

int main() {
    char ch;
    
    // Chiedi all'utente di inserire un carattere
    printf("Inserisci un carattere: ");
    scanf(" %c", &ch);
    
    // Converti il carattere in minuscolo per rendere il controllo non case-sensitive
    ch = tolower(ch);
    
    // Controllo se è una vocale o una consonante
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
        printf("Vocale\n");
    } else if ((ch >= 'a' && ch <= 'z')) {
        printf("Consonante\n");
    } else {
        printf("Carattere non valido\n");
    }
    
    return 0;
}
