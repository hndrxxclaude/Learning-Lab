#include <stdio.h>
#define ALUNNI 6

void inserimento_voti(int voti[]) {
    for (size_t i = 0; i < ALUNNI; i++) {
        printf("Inserire elemento %zu dell'array: ", i);
        scanf("%d", &voti[i]);
    }
}

void voti_ordinati(int voti[], int ordine) {
    if(ordine) {
        for (size_t i = 0; i < ALUNNI; i++) {
            printf("%d ", voti[i]);
        }
    } else {
        for(int i = ALUNNI - 1; i >= 0; i--) {
            printf("%d ", voti[i]);
        }
    }
}

void stampaMaxMin(int voti[]) {
    int max = voti[0],  min = voti[0];
    int pos_max = 0, pos_min = 0;
    for (size_t i = 1; i < ALUNNI; i++) {
        if(voti[i] > max) {
            max = voti[i];
            pos_max = i;
        }
        if (voti[i] < min) {
            min = voti[i];
            pos_min = i;
        }
    }
    printf("Il voto massimo è %d in posizione %d.\n", max, pos_max);
    printf("Il voto minimo è %d in posizione %d.\n", min, pos_min);
    
}

void stampamedia (int voti[]) {
    int totale = 0;
    float media;
    for (size_t i = 0; i < ALUNNI; i++) {
        totale += voti[i];
    }
    media = totale / ALUNNI;
    printf("La media dei voti è %.2f\n", media);
}

int main(void) {

    int voti_alunni[ALUNNI] = {0};
    int scelta;

    do {
        printf("\nMenu:\n");
        printf("1. Inserire tutti i valori dei voti\n");
        printf("2. Stampare i voti dal primo all’ultimo\n");
        printf("3. Stampare i voti dall’ultimo al primo\n");
        printf("4. Stampare il voto massimo e minimo con posizioni\n");
        printf("5. Stampare il voto medio\n");
        printf("0. Esci\n");
        printf("Scelta: ");
        scanf("%d", &scelta);

        switch(scelta) {
            case 1:
                inserimento_voti(voti_alunni);
            break;

            case 2:
                voti_ordinati(voti_alunni, 1);
            break;

            case 3:
                voti_ordinati(voti_alunni, 0);
            break;

            case 4:
                stampaMaxMin(voti_alunni);
            break;
            
            case 5 :
                stampamedia(voti_alunni);
            break;
            
            case 0 :
                printf("Uscita dal programma.\n");
            break;

            default :
            printf("Scelta non valida, riprova.\n");
        } 
    }while (scelta != 0);
    
    return 0;
}