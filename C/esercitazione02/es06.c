/*Implementare in C un programma che chieda all’utente di inserire tre caratteri e stampi sullo standard output
se il secondo di essi è compreso tra il primo e l’ultimo.*/

#include <stdio.h>

int main(void) {
    char carattere1, carattere2, carattere3;

    printf("Inserire 3 caratteri: \n");
    scanf(" %c %c %c", &carattere1, &carattere2, &carattere3);
    
    if(carattere1 < carattere2 && carattere2 < carattere3) {
        printf("%c\n", carattere2);
    } else if (carattere1 > carattere2 && carattere2 > carattere3) {
        printf("%c\n", carattere2);
    } else {
        printf("Il secondo carattere non è compreso tra il primo e il terzo\n");
    } 

    return 0;

}

#include <stdio.h>

int main() {
    char c1, c2, c3;
    
    // Chiedi all'utente di inserire tre caratteri
    printf("Inserisci tre caratteri separati da spazio: ");
    scanf(" %c %c %c", &c1, &c2, &c3);
    
    // Assicurati che c1 sia il minore e c3 il maggiore
    if (c1 > c3) {
        char temp = c1;
        c1 = c3;
        c3 = temp;
    }
    
    // Controlla se c2 è compreso tra c1 e c3
    if (c2 > c1 && c2 < c3) {
        printf("Il secondo carattere (%c) è compreso tra %c e %c.\n", c2, c1, c3);
    } else {
        printf("Il secondo carattere (%c) NON è compreso tra %c e %c.\n", c2, c1, c3);
    }
    
    return 0;
}
