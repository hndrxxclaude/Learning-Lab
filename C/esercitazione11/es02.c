/*Si implementi un programma per la gestione del ricettario digitale di un ristorante. Il ricettario contiene un
elenco di pietanze (massimo 100) con i relativi ingredienti e tempi di cottura (si riusi la struct dell’esercizio
precedente). Attraverso un menu testuale deve essere possibile:
a. inserire una nuova pietanza;
b. visualizzare gli ingredienti e le dosi di una pietanza il cui nome è inserito da tastiera;
c. visualizzare l’elenco delle pietanze in base alla tipologia (inserita da tastiera). Per esempio, l’elenco
degli antipasti o dei primi;
d. e. f. visualizzare il nome delle pietanze che contengono un certo ingrediente (inserito da tastiera);
visualizzare l’elenco delle pietanze con un tempo di cottura minore di un valore inserito da tastiera;
uscire dal programma o effettuare una nuova scelta.*/

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define SIZE 100
#define MAX_PIETANZE 100
#define MAX_INGREDIENTI 10

typedef struct {
    char nome_ingrediente[SIZE];
    double dose;
} Ingrediente;

typedef struct {
    char nome_piatto[SIZE];
    Ingrediente ingredienti[MAX_INGREDIENTI];
    size_t num_ingredienti;
    double tempo_cottura;
    char tipo_piatto[SIZE];
} Pietanza;

void inserisci_pietanza(Pietanza *piatto);
void stampa_pietanza(Pietanza piatto);
void cerca_nome(Pietanza *piatti, size_t num_pietanze);
void filtra_tipologia(Pietanza *piatti, size_t num_pietanze);
void cerca_ingrediente(Pietanza *piatti, size_t num_pietanze);
void filtra_cottura(Pietanza *piatti, size_t num_pietanze);

int main(void) {
    Pietanza piatti[MAX_PIETANZE];
    size_t num_pietanze = 0;
    int scelta;

    do {
        printf("\nMenu Ricettario:\n");
        printf("1: Inserire una nuova pietanza\n");
        printf("2: Visualizzare gli ingredienti e le dosi di una pietanza\n");
        printf("3: Visualizzare l’elenco delle pietanze in base alla tipologia\n");
        printf("4: Visualizzare il nome delle pietanze che contengono un certo ingrediente\n");
        printf("5: Visualizzare l’elenco delle pietanze con un tempo di cottura minore di un valore\n");
        printf("0: Uscire dal programma\n");
        printf("Inserire una scelta: ");
        scanf("%d", &scelta);
        printf("\n");

        switch (scelta) {
            case 1:
                if (num_pietanze <= MAX_PIETANZE) {
                    inserisci_pietanza(&piatti[num_pietanze]);
                    num_pietanze++;
                } else {
                    printf("Limite massimo di pietanze raggiunto.\n");
                }
                break;
            case 2:
                cerca_nome(piatti, num_pietanze);
                break;
            case 3:
                filtra_tipologia(piatti, num_pietanze);
                break;
            case 4:
                cerca_ingrediente(piatti, num_pietanze);
                break;
            case 5:
                filtra_cottura(piatti, num_pietanze);
                break;
            case 0:
                printf("Uscita dal programma...\n");
                break;
            default:
                printf("Scelta non valida.\n");
        }
    } while (scelta != 0);  

    return 0;
}

void inserisci_pietanza(Pietanza *piatto) {
    printf("Inserire nome del piatto: ");
    scanf(" %[^\n]", piatto->nome_piatto);

    do {
        printf("Inserire il numero di ingredienti (max %d): ", MAX_INGREDIENTI);
        scanf("%lu", &piatto->num_ingredienti);
    } while (piatto->num_ingredienti < 1 || piatto->num_ingredienti > MAX_INGREDIENTI);

    for (size_t i = 0; i < piatto->num_ingredienti; i++) {
        printf("Inserire il nome dell'ingrediente %lu: ", i + 1);
        scanf(" %[^\n]", piatto->ingredienti[i].nome_ingrediente);

        printf("Inserire la dose (in grammi) di %s: ", piatto->ingredienti[i].nome_ingrediente);
        scanf("%lf", &piatto->ingredienti[i].dose);
    }

    printf("Inserire il tempo di cottura: ");
    scanf("%lf", &piatto->tempo_cottura);

    printf("Inserire il tipo di piatto (antipasto, primo, secondo, contorno, dolce): ");
    scanf(" %[^\n]", piatto->tipo_piatto);
}

void stampa_pietanza(Pietanza piatto) {
    printf("\nNome del piatto: %s\n", piatto.nome_piatto);

    printf("\n%lu Ingredienti:\n", piatto.num_ingredienti);
    for (size_t i = 0; i < piatto.num_ingredienti; i++) {
        printf("%lu: %s, %g grammi\n", i + 1, piatto.ingredienti[i].nome_ingrediente, piatto.ingredienti[i].dose);
    }

    printf("\nTempo di cottura: %g minuti\n", piatto.tempo_cottura);
    printf("Tipo di piatto: %s\n", piatto.tipo_piatto);
}

void cerca_nome(Pietanza *piatti, size_t num_pietanze) {
    char nome[SIZE];
    bool found = false;

    printf("Inserire il nome del piatto: ");
    scanf(" %[^\n]", nome);

    for (size_t i = 0; i < num_pietanze; i++) {
        if (strcmp(piatti[i].nome_piatto, nome) == 0) {
            stampa_pietanza(piatti[i]);
            return;
        }
    }
    printf("Piatto non trovato.\n");
}

void filtra_tipologia(Pietanza *piatti, size_t num_pietanze) {
    char tipo[SIZE];
    bool found = false;

    printf("Inserire la tipologia di piatto da cercare (antipasto, primo, secondo contorno, dolce): ");
    scanf(" %[^\n]", tipo);

    for (size_t i = 0; i < num_pietanze; i++) {
        if (strcmp(piatti[i].tipo_piatto, tipo) == 0) {
            printf("- %s\n", piatti[i].nome_piatto);
            found = true;
        }
    }

    if (found == false)  {
        printf("Piatto non trovato.\n");
    }
}

void cerca_ingrediente(Pietanza *piatti, size_t num_pietanze) {
    char ingrediente[SIZE];
    bool found = false;

    printf("Inserire l'ingrediente: ");
    scanf(" %[^\n]", ingrediente);

    for (size_t i = 0; i < num_pietanze; i++) {
        for (size_t j = 0; j < piatti[i].num_ingredienti; j++) {
            if (strcmp(piatti[i].ingredienti[j].nome_ingrediente, ingrediente) == 0) {
                printf("- %s\n", piatti[i].nome_piatto);
                found = true;
                break;
            }
        }
    }

    if (found == false) {
        printf("Nessun piatto trovato con l'ingrediente indicato.\n");
    }
}


void filtra_cottura(Pietanza *piatti, size_t num_pietanze) {
    double tempo_massimo;
    bool found = false;

    printf("Inserire il tempo massimo di cottura: ");
    scanf("%lf", &tempo_massimo);

    for (size_t i = 0; i < num_pietanze; i++) {
        if (piatti[i].tempo_cottura < tempo_massimo) {
            printf("- %s (%g minuti)\n", piatti[i].nome_piatto, piatti[i].tempo_cottura);
            found = true;
        }
    }

    if (found == false)  {
        printf("Nessun piatto trovato con l'ingrediente indicato.\n");
    }
}
