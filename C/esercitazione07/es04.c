/*Un palindromo è una sequenza di caratteri che, letta al contrario, rimane invariata.
• Ad esempio, “anna”, “radar”, “onorarono” sono palindromi.
• Anche intere frasi possono essere palindrome. Ad esempio, ignorando gli spazi, “i topi non avevano
nipoti” è una frase palindroma.
Scrivere una funzione che accetti una stringa come argomento e che restituisca 1 se la stringa è palindroma, 0
se non lo è. La funzione deve ignorare gli spazi.
Scrivere poi un programma che chieda all’utente di inserire una stringa (massimo 100 caratteri) e che utilizzi la
funzione appena definita.*/

#include <stdio.h>
#define SIZE 101

int palindromo(char array[], size_t size) {

    char clean[SIZE];
    int j = 0;

    // Rimuove solo gli spazi ' '
    for (int i = 0; array[i] != '\0'; i++) {
        if (array[i] != ' ') {
            clean[j++] = array[i];
        }
    }
    clean[j] = '\0';

    int i = 0;
    int f = 0;
    while (clean[f] != '\0'){
        f++;
    }
    f = f - 1;
    while(i < f) {
        if(clean[i] != clean[f]){
            return 0;
        }
        i++;
        f--;
    }
    return 1;
}

int main(void) {

    char array[SIZE];

    printf("Inserire stringa (max 100 caratteri): ");
    scanf("%100[^\n]", array);

    int verifica_palindromo = palindromo(array,SIZE);
    printf("\nVerrà visualizzato 1 se la stringa è palindroma, 0 se non lo è.\n");
    printf("%d\n", verifica_palindromo);

    return 0;
}