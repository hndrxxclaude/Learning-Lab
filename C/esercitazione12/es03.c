/* Modificare il programma dell’esercitazione precedente per memorizzare il ricettario all’interno di un file.
Il nome del file deve essere passato come parametro da riga di comando.
All’avvio del programma deve essere caricato il contenuto attuale del ricettario nelle opportune strutture dati.
Ogni volta che si vuole inserire una nuova pietanza, questa, oltre ad essere aggiunta alle opportune strutture
dati, deve anche essere memorizzata all’interno del file.

Nota 1: è necessario stabilire il formato che deve avere il file, in termini di separatori tra i vari campi
Nota 2: riflettere sulla modalità di apertura del file più adatta */

#include <stdio.h>

#define STRING_LENGTH 100
#define MAX_PIETANZE 100
#define MAX_INGREDIENTI 10

typedef struct {
    char nome_ingrediente[STRING_LENGTH];
    double dose;
} Ingrediente;

typedef struct {
    char nome_piatto[STRING_LENGTH];
    Ingrediente ingredienti[MAX_INGREDIENTI];
    size_t num_ingredienti;
    double tempo_cottura;
    char tipo_piatto[STRING_LENGTH];
} Pietanza;

void inserisci_pietanza(Pietanza *piatto);
void stampa_pietanza(Pietanza piatto);

void scrivo_su_file(const char *nome_file);
void leggo_da_file(const char *nome_file);

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: %s nome_file_ricettario\n", argv[0]);
        return 1;
    }
    const char *nome_file = argv[1];

    scrivo_su_file(nome_file);

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

void scrivo_su_file(const char *nome_file) {
    FILE *fp = fopen(nome_file, "a");
    if (fp == NULL) {
        printf("Errore nell'apertura del file.\n");
        return;
    }

    char fine = 'n';
    while (fine == 'n') {
        Pietanza piatto;
        inserisci_pietanza(&piatto);

        fprintf(fp, "%s\n", piatto.nome_piatto);
        fprintf(fp, "%lu\n", piatto.num_ingredienti);

        for (size_t i = 0; i < piatto.num_ingredienti; i++) {
            fprintf(fp, "%s %g grammi\n", piatto.ingredienti[i].nome_ingrediente, piatto.ingredienti[i].dose);
        }
        fprintf(fp, "%g minuti\n", piatto.tempo_cottura);
        fprintf(fp, "%s\n\n", piatto.tipo_piatto);

        printf("\nFinito (y/n)?: ");
        scanf(" %c", &fine);
        printf("\n");
    }

    fclose(fp);
}
