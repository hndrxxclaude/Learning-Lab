#include <stdio.h>

int main(void) {

    char stringa[20];
    printf("Inserire la stringa\n");
    scanf("%19[^\n]", stringa);

    printf("La stringa è:\n");
    printf("%s\n", stringa);

    return 0;
}