/*Si implementi un programma che permetta di rappresentare attraverso una opportuna struct una pietanza.
Di ogni pietanza conosciamo: il nome, gli ingredienti e le corrispondenti dosi (in g), il tempo di cottura, il tipo
di piatto (antipasto, primo, secondo, contorno, dolce).
Nel main, chiedere all’utente di inserire da tastiera i dati di una pietanza (lasciandogli scegliere il numero di
ingredienti) e poi stampare i dati a schermo.
Esempio: nome = pasta col pomodoro, {(pasta, 80g), (salsa, 40g), (parmigiano, 20g)}, 15 minuti, primo
piatto. Oppure nome = cotoletta, {(carne, 140g), (uovo, 30g), (pan grattato, 30g), (sale, 5g), (olio, 20g)}, 7
minuti, secondo piatto (notare che la lista degli ingredienti è variabile: si consideri che ci possano essere al più
10 ingredienti).*/

#include <stdio.h>

typedef struct ingredienti {
    char nome[30];
    double dose;
} Ingerdiente;

typedef struct pietanza {
    char nome[30];
    Ingerdiente ingredienti[10];
    int num_ingredienti;
    double tempo_di_cottura;
    char tipo_di_piatto[20];
} Pietanza;

void inserire_pietanza (Pietanza *p) {
    printf("Inserire nome della pietanza: ");
    scanf(" %[^\n]", p->nome);

    do {
        printf("\nInserire il numero di ingredienti necessari per preparare la pietanza (max 10): ");
        scanf("%d", &p->num_ingredienti);
    } while (p->num_ingredienti < 1 || p->num_ingredienti > 10);

    for (int i = 0; i < p->num_ingredienti; i++) {
        printf("Inserire il nome dell'ingrediente %d: ", i + 1);
        scanf(" %[^\n]", p->ingredienti[i].nome);

        printf("Inserire la dose(gr.): ");
        scanf("%lf", &p->ingredienti[i].dose);
    }

    printf("Inserire il tempo di cottura(min.): ");
        scanf("%lf", &p->tempo_di_cottura);

        printf("Inserire la tipologia di portata(antipasto, primo, secondo, contorno, dolce): ");
        scanf(" %[^\n]", p->tipo_di_piatto);
}

void stampa_pietanza (Pietanza piatto) {
    printf("Nome del piatto: %s\n", piatto.nome);
    printf("%d Ingredienti:\n", piatto.num_ingredienti);
    for (int i = 0; i < piatto.num_ingredienti; i++) {
        printf("Ingrediente %d: %s, %.2f grammi.\n", i + 1, piatto.ingredienti[i].nome, piatto.ingredienti[i].dose);
    }
    printf("Tempo di cottura: %.2f minuti.\n", piatto.tempo_di_cottura);
    printf("Tipologia di portata: %s.\n", piatto.tipo_di_piatto);
}

int main(void) {

    Pietanza piatto;

    inserire_pietanza(&piatto);
    stampa_pietanza(piatto);
    
    return 0;
}