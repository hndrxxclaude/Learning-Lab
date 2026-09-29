#include <stdio.h>

/*mplementare in C un programma che consenta all’utente di inserire un anno e di verificare se esso è bisestile.
Suggerimento: un anno è bisestile se è divisibile per 4 ma non per 100, oppure se è divisibile per 400 (ad esempio
il 1900 non è stato bisestile, mentre il 2000 lo è stato).*/

int main(void) {

    int anno;

    printf("Inserire un anno: \n");
    scanf("%d", &anno);

    if(anno > 0) {
        if(anno % 4 == 0 && anno % 100 != 0 ||  anno % 400 == 0) {
        printf("L'anno è bisestile\n");
      } else {
        printf("L'anno non è bisestile\n");
      }
    } else {
        printf("Anno invalido\n");
    }
   return 0;
}