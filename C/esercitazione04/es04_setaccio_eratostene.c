/*Un numero primo è un intero maggiore di 1 divisibile solo per se stesso e per 1. Il Setaccio di Eratostene è un
metodo per trovare i numeri primi. L’algoritmo opera come segue:
a. Si crea un array con tutti gli elementi inizializzati a 1 (true). Gli elementi dell’array con indici primi
rimarranno con valore 1. Tutti gli altri elementi dell’array saranno alla fine posti a zero (false).
.
b. Partendo dall’indice 2 dell’array (l’indice 1 non è primo), ogni volta che si trova un elemento dell’array il
cui valore è 1, si effettua un’iterazione lungo il resto dell’array e si pone a zero ogni elemento il cui
indice è un multiplo dell’indice dell’elemento con valore 1.
Per l’indice 2 dell’array, tutti gli elementi che seguono nell’array e che sono multipli di 2 saranno posti a
zero (quelli con indici 4, 6, 8, 10 e così via). Per l’indice 3 dell’array, tutti gli elementi successivi nell’array
che sono multipli di 3 saranno posti a zero (quelli con indici 6, 9, 12, 15 e così via).
Al termine di questo processo, gli elementi dell’array che hanno ancora il valore 1 indicano che l’indice
corrispondente è un numero primo.
.
Scrivere un programma C che usi un array di 1000 elementi per trovare e stampare i numeri primi tra 1 e 999.
Ignorare l’elemento con indice 0 dell’array.*/

#include <stdio.h>
#define SIZE 1000

void setaccio_eratostene(int array[], size_t num_elementi) {
    // inizializziamo i valori
    for (size_t i = 0; i < num_elementi; i++) {
        array[i] = 1;
    }
    
    for (size_t i = 2; i < num_elementi; i++) {
        if (array[i] == 1) {
            // eliminiamo i multipli di i
            int multiplo = i * 2;
            while (multiplo < num_elementi) {
                array[multiplo] = 0;
                multiplo += i;
            }
        }
    }
}

int main(void) {
    int numeri_primi[SIZE];

    setaccio_eratostene(numeri_primi, SIZE);

    // stampiamo gli indici dei valori che sono posti a 1
    printf("Numeri primi minori di %d:\n", SIZE);
    for (size_t i = 2; i < SIZE; i++) {
        if (numeri_primi[i] == 1) {
            printf("%lu\n", i);
        }
    }

    return 0;
}
