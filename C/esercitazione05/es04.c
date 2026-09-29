/*Scrivere un programma in linguaggio C che consenta agli utenti di gestire un vettore di numeri reali,
rappresentato tramite un array (suddividere il programma in funzioni, anche sfruttando le funzioni definite
nei quesiti precedenti).
All’avvio, il programma deve chiedere all’utente la dimensione del vettore da gestire (la dimensione non deve
essere superiore a 100) e deve successivamente interagire con l’utente per l’acquisizione degli elementi dallo
standard input.
Successivamente, il programma deve consentire all’utente di compiere ripetutamente una delle seguenti
azioni:
1. inserire nuovi valori nel vettore, sostituendo i precedenti;
2. calcolare la somma del quadrato degli elementi del vettore;
3. verificare se gli elementi del vettore sono in ordine crescente;
4. uscire dal programma.*/

#include <stdio.h>

void inserimento_valori(double array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        printf("Inserire elemento %zu dell'array: ", i + 1);
        scanf("%lf", &array[i]);
    }
}

double somma_di_quadrati(double array[], size_t size) {
    double totale = 0;
    for (size_t i = 0; i < size; i++) {
        totale += array[i] * array[i]; 
    }
    return totale;
}

int ordine_crescente (double array[], size_t size) {
    double temp = array[0];
    for (size_t i = 1; i < size; i++){
        if (array[i] < temp) {
            return 0;
        }
        temp = array[i];
    }
    return 1;
}

void stampaMenù() {
    printf("\n======== MENÙ ========\n");
    printf("1. Inserire nuovi valori nel vettore (sostituisce i precedenti)\n");
    printf("2. Calcolare la somma dei quadrati degli elementi del vettore\n");
    printf("3. Verificare se il vettore è in ordine crescente\n");
    printf("0. Uscita dal programma\n");
    printf("======================\n");
}

int main(void) {

    int dimensione, crescente;
    double totale;

    do {
        printf("Inserire una dimensione per l'array: ");
        scanf("%d", &dimensione);
        if ( dimensione < 1 || dimensione > 100) {
            printf("Inserire un valore intero maggiore o pari a 1 o minore o pari a 100 per la dimensione dell'array.\n");
        }
        } while (dimensione <= 0 || dimensione > 100);

    double array[dimensione];
    inserimento_valori(array, dimensione);

    int scelta;

    do {
        stampaMenù();
        scanf("%d", &scelta);

        if (scelta < 0 || scelta > 3) {
            do {
                printf("Selezionare una scelta tra 0 e 3.\n");
                stampaMenù();
                scanf("%d", &scelta);
            } while (scelta < 0 || scelta > 3);
        }

        switch (scelta) {

            case 1:
                inserimento_valori(array, dimensione);
            break;

            case 2:
                totale = somma_di_quadrati(array,dimensione);
                printf("\nLa somma di quadrati dei valori inseriti è %.2f.\n", totale);
                break;

            case 3:
                crescente = ordine_crescente(array,dimensione);
                printf("\nVerrà visualizzato il valore 1 se gli elementi dell'array sono in ordine crescente, 0 in caso contrario:\n\n");
                printf("%d\n", crescente);
            break;

            case 0:
                printf("\nUscita dal programma.\n");
            break;
        }
    } while (scelta != 0);

    return 0;
}