/*Scrivere un programma in linguaggio C che chieda all’utente di inserire due stringhe (massimo 100 caratteri
ciascuna) e verifichi se sono anagrammi l’una dell’altra.
Due stringhe sono anagrammi se contengono esattamente gli stessi caratteri (con la stessa frequenza), ma in
ordine diverso. Considerare solo lettere minuscole dell’alfabeto e ignorare gli spazi nel confronto.*/

#include <stdio.h>

#define SIZE 101

int sono_anagrammi(char s1[], char s2[]) {
    int freq1[26] = {0};
    int freq2[26] = {0};

    // Conta le lettere in s1
    for (int i = 0; s1[i] != '\0'; i++) {
        if (s1[i] >= 'a' && s1[i] <= 'z') {
            freq1[s1[i] - 'a']++;
        }
    }

    // Conta le lettere in s2
    for (int i = 0; s2[i] != '\0'; i++) {
        if (s2[i] >= 'a' && s2[i] <= 'z') {
            freq2[s2[i] - 'a']++;
        }
    }

    // Confronta le frequenze
    for (int i = 0; i < 26; i++) {
        if (freq1[i] != freq2[i]) {
            return 0;
        }
    }

    return 1;
}

int main() {
    char str1[SIZE], str2[SIZE];

    printf("Inserire la prima stringa (solo minuscole, max 100 caratteri):\n");
    scanf("%100[^\n]", str1);

    printf("Inserire la seconda stringa:\n");
    scanf(" %100[^\n]", str2);

    if (sono_anagrammi(str1, str2)) {
        printf("Le stringhe sono anagrammi.\n");
    } else {
        printf("Le stringhe NON sono anagrammi.\n");
    }

    return 0;
}
