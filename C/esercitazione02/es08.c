/*Definire e implementare in C un programma che permetta di stabilire (utilizzando il costrutto switch) la
stagione corrispondente al mese inserito come intero dall’utente. Qualora il mese sia Marzo, Giugno,
Settembre o Dicembre, tutti mesi a cavallo di due stagioni, si richieda all’utente di specificare anche il giorno.
Se il giorno è compreso tra 1 e 20 si considera la stagione precedente, altrimenti quella successiva. Esempio:
se l’utente digita 1 (Gennaio) il programma deve stampare Inverno.*/

#include <stdio.h>

int main(void) {

    int mese, giorno;

    printf("Inserire il mese come numero intero da 1 a 12: \n");
    scanf("%d", &mese);

    switch (mese)
    {
    case 1:
        printf("Inverno\n");
        break;
    case 2:
        printf("Inverno\n");
        break;
    case 3:
        printf("Inserire giorno: \n");
        scanf("%d", &giorno);
        if(giorno >= 1 && giorno <= 20) {
            printf("Inverno\n");
        } else {
            printf("Primavera\n");
        }
        break;
    case 4:
        printf("Primavera\n");
        break;
    case 5:
        printf("Primavera\n");
        break;
    case 6:
        printf("Inserire giorno: \n");
        scanf("%d", &giorno);
        if(giorno >= 1 && giorno <= 20) {
            printf("Primavera\n");
        } else {
            printf("Estate\n");
        }
        break;
    case 7:
        printf("Estate\n");
        break;
    case 8:
        printf("Estate\n");
        break;
    case 9:
        printf("Inserire giorno: \n");
        scanf("%d", &giorno);
        if(giorno >= 1 && giorno <= 20) {
            printf("Estate\n");
        } else {
            printf("Autunno\n");
        }
        break;
    case 10:
        printf("Autunno\n");
        break;
    case 11:
        printf("Autunno\n");
        break;
    case 12:
        printf("Inserire giorno: \n");
        scanf("%d", &giorno);
        if(giorno >= 1 && giorno <= 20) {
            printf("Autunno\n");
        } else {
            printf("Inverno\n");
        }
        break;
    default:
        printf("Mese non valido! Inserire un numero tra 1 e 12.\n");
        break;
}
    return 0;
}