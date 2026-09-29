/*Definire una funzione find_char che cerchi in una stringa un carattere passato per argomento.
Se il carattere viene trovato, restituire un puntatore a quel carattere.
Se non viene trovato, restituire NULL.
Prototipo della funzione da realizzare:
char *find_char(char string[], char c);
Nella funzione main, provare a modificare il valore del carattere puntato (se il puntatore non è NULL) e
verificare che anche la stringa di partenza viene modificata.*/

#include <stdio.h>
#define SIZE 100

char *find_char(char string[], char c) {
   
    int i = 0;

    while (string[i] != '\0') {
        if (string[i] == c){
            return &string[i];
        }
        i++;
    }
    return NULL;
}

int main(void) {

    char string[SIZE];
    char c;
    size_t i = 0;

    printf("Inserire la stringa: ");
    scanf(" %99[^\n]", string);
    printf("\nInserire il carattere da cercare: ");
    scanf(" %c", &c);

    char *carattere_puntato = find_char(string, c);

    if (carattere_puntato != NULL){
        printf("\nModificare il carattere: ");
        scanf(" %c", carattere_puntato);
    } else {
        printf("\nCarattere non trovato.\n");
    } 

    printf("Stringa modificata : %s\n", string);


    return 0;
}