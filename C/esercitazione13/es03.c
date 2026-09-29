/*Si implementi un programma che dia la possibilità all’utente di gestire un insieme di numeri interi,
memorizzandoli in un albero binario di ricerca. L’utente deve potere compiere ripetutamente una delle
seguenti azioni, selezionandola da un menu testuale:
- inserire un nuovo elemento nell’albero in maniera ordinata e stampare (in ordine) il contenuto del nuovo
albero ottenuto;
- contare quante volte un numero è presente nell’albero.*/

#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int value;
    struct Node *left;
    struct Node *right;
} Node;

Node *creaNodo(int value) {
    Node *new = malloc(sizeof(Node));
    if (new != NULL) {
        new->value = value;
        new->left = NULL;
        new->right = NULL;
    }
    return new;
}

Node *inserisci(Node *root, int value) {
    if (root == NULL) {
    return creaNodo(value);
    }
    if (value < root->value) {
        root->left = inserisci(root->left, value);
    } else {
        root->right = inserisci(root->right, value);
    }
    return root;
}

void stampaAlbero(Node *root) {
    if (root != NULL) {
        stampaAlbero(root->left);
        printf("%d ", root->value);
        stampaAlbero(root->right);
    }
}

int cerca(Node *root, int value) {
    if (root == NULL) return 0;

    int counter = 0;
    if (root->value == value) {
        counter = 1;
    }

    return counter + cerca(root->left, value) + cerca(root->right, value);
}

int main(void) {

    Node *root = NULL;
    int scelta;
    int value;
    int ricerca;
    int counter;

    do {
        printf("\nMenù:\n");
        printf("1: Inserire un nuovo elemento nell'albero in maniera ordinata e stampare (in ordine) il contenuto del nuovo albero ottenuto.\n");
        printf("2: Contare quante volte un numero è presente nell'albero.\n");
        printf("0: Uscire dal programma.\n");
        printf("Inserire una scelta: ");
        scanf("%d", &scelta);

        switch(scelta) {
            case 1: 
                printf("Inserire il valore da inserire nell'albero: ");
                scanf("%d", &value);

                root = inserisci(root, value);
                stampaAlbero(root);

                break;
            
            case 2: 
                printf("Inserire il valore da ricercare: ");
                scanf("%d", &ricerca);
                counter = cerca(root, ricerca);
                printf("L'elemento ricercato è presente %d volte nell'albero.\n", counter);

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