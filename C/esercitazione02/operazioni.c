#include <stdio.h>

/*Permettere all’utente di inserire due numeri e un operatore tra +, -, /, * e stampare il risultato
dell’operazione.*/

int main(void) {
    float numero_1, numero_2, risultato;
    char operazione;

    printf("Scegliere un'operazione da eseguire: Addizione: '+', Sottrazione: '-', Moltiplicazione: '*', Divisione: '/'\n");
    scanf(" %c", &operazione);
    printf("Inserire 2 numeri: \n");
    scanf("%f%f", &numero_1, &numero_2);

    if (operazione == '+') {
        risultato = numero_1 + numero_2;
    } else if(operazione == '-') {
        risultato = numero_1 - numero_2;
    } else if(operazione == '*'){
        risultato = numero_1 * numero_2;
    } else if(operazione == '/') {
        risultato = numero_1 / numero_2;
    } else {
        printf("Operatore non valido\n");
    }

    printf("Il risultato è: %g\n", risultato);

    return 0;

}

#include <stdio.h>

/*Permettere all’utente di inserire due numeri e un operatore tra +, -, /, * e stampare il risultato
dell’operazione.*/

int main(void) {
    float numero_1, numero_2, risultato;
    char operazione;

    printf("Scegliere un'operazione da eseguire: Addizione: '+', Sottrazione: '-', Moltiplicazione: '*', Divisione: '/'\n");
    scanf(" %c", &operazione);
    printf("Inserire 2 numeri: \n");
    if (scanf("%f%f", &numero_1, &numero_2) != 2) {
        printf("Errore: Inserire due numeri validi.\n");
        return 1;
    }

    switch (operazione) {
        case '+':
            risultato = numero_1 + numero_2;
            break;
        case '-':
            risultato = numero_1 - numero_2;
            break;
        case '*':
            risultato = numero_1 * numero_2;
            break;
        case '/':
            if (numero_2 == 0) {
                printf("Errore: Divisione per zero non consentita.\n");
                return 1;
            }
            risultato = numero_1 / numero_2;
            break;
        default:
            printf("Operatore non valido\n");
            return 1;
    }

    printf("Il risultato è: %g\n", risultato);

    return 0;
}
