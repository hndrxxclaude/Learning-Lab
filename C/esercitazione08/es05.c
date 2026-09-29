/*Scrivere un programma che chieda all’utente di inserire una stringa e un carattere separatore (ad esempio il
carattere spazio) e che divida la stringa in token ogni volta che viene incontrato il separatore.
Ad esempio, se la stringa è “Uno due tre quattro” e il separatore è lo spazio, la stringa sarà separata nei
quattro token “Uno”, “due”, “tre” e “quattro”.
Per semplicità, si supponga che nella stringa ci siano al massimo 10 token e che ciascun token sia lungo al
massimo 20 caratteri. Si definisca una funzione che accetta come parametro la stringa, il separatore e un array
di stringhe (di lunghezza 10) in cui memorizzare i vari token. La funzione deve anche restituire il numero di
token riconosciuti.
Prototipo della funzione da realizzare:
int my_strtok(const char *string, char sep, char token[][20]);*/

#include <stdio.h>
#include <string.h>
#define SIZE 100

int my_strtok(const char *string, char sep, char token[][20]) {
    int token_count = 0;
    int char_index = 0;

    for (int i = 0; string[i] != '\0'; i++) {
        if (string[i] == sep) {
            if (char_index > 0) { // evita token vuoti
                token[token_count][char_index] = '\0';
                token_count++;
                char_index = 0;

                if (token_count >= 10) break; // limite token
            }
        } else {
            if (char_index < 19) { // evita overflow token
                token[token_count][char_index] = string[i];
                char_index++;
            }
        }
    }

    // aggiunge ultimo token se necessario
    if (char_index > 0 && token_count < 10) {
        token[token_count][char_index] = '\0';
        token_count++;
    }

    return token_count;
}


int main(void) {

    char stringa[SIZE];
    char separatore;
    char tokens[10][20];

    printf("Inserire stringa: ");
    scanf(" %99[^\n]", stringa);

    printf("\nInserire il carattere separatore: ");
    scanf(" %", &separatore);

    int num_tokens = my_strtok(stringa,separatore,tokens);

    printf("Tokens trovati: %d", num_tokens);
    for (int i = 0; i < num_tokens; i++) {
        printf("Token %d: %s\n", i + 1, tokens[i]);
    }

    return 0;
}