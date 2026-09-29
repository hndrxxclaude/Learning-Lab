/*Implementare in C un programma che chieda all’utente di inserire tre lunghezze dei lati di un triangolo e stampi
sullo standard output se il triangolo è scaleno, isoscele o equilatero.
Nota bene: il programma deve restituire solo la tipologia più particolare, ovvero se è equilatero, stampa solo la
stringa "Equilatero" e non stampa anche la stringa "Isoscele".*/

#include <stdio.h>

int main() {
    int a, b, c;
    
    // Chiedi all'utente di inserire le lunghezze dei lati del triangolo
    printf("Inserisci tre lunghezze dei lati di un triangolo: ");
    scanf("%d %d %d", &a, &b, &c);
    
    // Controllo se i lati formano un triangolo valido
    if (a + b > c && a + c > b && b + c > a) {
        if (a == b && b == c) {
            printf("Equilatero\n");
        } else if (a == b || b == c || a == c) {
            printf("Isoscele\n");
        } else {
            printf("Scaleno\n");
        }
    } else {
        printf("Le lunghezze inserite non formano un triangolo valido.\n");
    }
    
    return 0;
}