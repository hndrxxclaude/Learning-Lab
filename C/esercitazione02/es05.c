/*La prima volta che l’uomo è andato sulla Luna è stato il 1969. Implementare in C un programma che chieda
l’anno di nascita all’utente e risponda se tale anno è quello in cui l’uomo è andato sulla Luna o quanti anni prima
o quanti anni dopo.*/

#include <stdio.h>
 int main(void) {
     
    int anno_di_nascita, differenza;

     printf("Inserire il proprio anno di nascita\n");
     scanf("%d", &anno_di_nascita);

    if(anno_di_nascita == 1969) {
        printf("L'utente è nato nell'anno in cui l'uomo andò sulla Luna\n");
    } else if(anno_di_nascita < 1969) {
        differenza = 1969 - anno_di_nascita;
        printf("L'utente è nato %d anni prima\n", differenza);
    }else {
        differenza = anno_di_nascita - 1969;
        printf("L'utente è nato %d anni dopo\n", differenza);
    }
    return 0;


 }