/*Implementare in C un programma in grado di determinare il primo ed il secondo classificato di una gara dei
100 metri a cui partecipano N corridori.
Il programma dovrà chiedere all’utente:
• l’inserimento dell’identificativo (un numero intero tra 1 e 255) di ogni partecipante;
• il tempo impiegato dallo stesso espresso in secondi (per esempio, 9.878).
Al termine dell’inserimento, il programma dovrà stampare a video l’identificativo ed il tempo del vincitore e del
secondo classificato. Si assuma che non ci siano due corridori che abbiano impiegato esattamente lo stesso
tempo e che nessun corridore impieghi più di 20 secondi.*/

#include <stdio.h>

int main(void) {

    int id, numero_partecipanti, id_primo = -1, id_secondo = -1;
    float tempo, tempo_primo = 20.001, tempo_secondo = 20.001;

    printf("Inserire il numero di partecipanti: \n");
    scanf("%d", &numero_partecipanti);

    if (numero_partecipanti < 2 && numero_partecipanti > 255) {
        printf("Il numero di partecipanti deve essere maggiore o pari a 2 e minore o pari a 255.\n");
    }

    for (int i = 0; i < numero_partecipanti; i++) {
        printf("Inserire il numero id (1-255): \n");
        scanf("%d", &id);

    if (id < 1 || id > 255) {
        printf("Errore: ID non valido. Deve essere tra 1 e 255.\n");
        return 1;
    }

    printf("Inserire il tempo impiegato (max 20 sec):\n");
    scanf("%f", &tempo);

    if (tempo <= 0 || tempo > 20.000) {
        printf("Errore: Tempo non valido. Deve essere tra 0 e 20 secondi.\n");
        return 1;
    }

    if (tempo < tempo_primo) {
        // Sposta il primo al secondo posto
        tempo_secondo = tempo_primo;
        id_secondo = id_primo;

        // Aggiorna il vincitore
        tempo_primo = tempo;
        id_primo = id;
        } else if (tempo < tempo_secondo) {
        // Aggiorna solo il secondo classificato
        tempo_secondo = tempo;
        id_secondo = id;
        }
    }
    printf("\n🏆 Vincitore: Corridore %d con %.3f secondi\n", id_primo, tempo_primo);
    printf("🥈 Secondo classificato: Corridore %d con %.3f secondi\n", id_secondo, tempo_secondo);

    return 0;
}