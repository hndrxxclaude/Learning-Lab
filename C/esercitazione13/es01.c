/*Si implementi un programma che dia la possibilità all’utente di gestire un insieme di numeri interi,
memorizzandoli in una lista. L’utente deve potere compiere ripetutamente una delle seguenti azioni,
selezionandola da un menu testuale:
- inserire un nuovo elemento nella lista in maniera ordinata e stampare la nuova lista ottenuta;
- contare quante volte un numero è presente nella lista;
- cancellare un elemento a partire dal suo valore (se l’elemento è presente più volte, devono essere
eliminate tutte le occorrenze) e stampare la nuova lista ottenuta;
- modificare la lista, impostando ogni elemento al quadrato del suo attuale valore e stampare la nuova
lista ottenuta.*/

#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *next;
} Node;

Node *insert_head(Node *head, int value);
Node *insert_tail(Node *head, int value);
Node *delete_node(Node *head, int value);
int count_elements(Node *head, int value);
Node *modify_list(Node *head);
void print_list(Node *head);

int main(void) {
    Node *head = NULL;
    int scelta;
    int value;

    do {
        printf("\nMenù:\n");
        printf("1: Inserire un nuovo elemento nella lista in maniera ordinata e stampare la nuova lista ottenuta\n");
        printf("2: Contare quante volte un numero è presente nella lista\n");
        printf("3: Cancellare un elemento a partire dal suo valore (se l’elemento è presente più volte, devono essere eliminate tutte le occorrenze) e stampare la nuova lista ottenuta\n");
        printf("4: Modificare la lista, impostando ogni elemento al quadrato del suo attuale valore e stampare la nuova lista ottenuta\n");
        printf("0: Uscire dal programma\n");
        printf("Inserire una scelta: ");
        scanf("%d", &scelta);

        switch (scelta) {
            case 1:
                printf("Inserire valore da aggiungere: ");
                scanf("%d", &value);

                if (head == NULL || value < head->data) {
                    head = insert_head(head, value);
                } else {
                    Node *prev = NULL, *curr = head;
                    while (curr != NULL && curr->data <= value) {
                        prev = curr;
                        curr = curr->next;
                    }

                    Node *new = malloc(sizeof(Node));
                    if (new != NULL) {
                        new->data = value;
                        new->next = curr;
                        prev->next = new;
                    } else {
                        printf("Errore di allocazione.\n");
                    }
                }

                printf("Lista aggiornata: ");
                print_list(head);
                break;

            case 2:
                printf("Inserire valore da contare: ");
                scanf("%d", &value);
                printf("Occorrenze di %d: %d\n", value, count_elements(head, value));
                break;

            case 3:
                printf("Inserire valore da eliminare: ");
                scanf("%d", &value);
                // ripeti la cancellazione finché ci sono occorrenze
                while (count_elements(head, value) > 0) {
                    head = delete_node(head, value);
                }
                printf("Lista aggiornata: ");
                print_list(head);
                break;

            case 4:
                head = modify_list(head);
                printf("Lista aggiornata con tutti gli elementi elevati al quadrato: ");
                print_list(head);
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

Node *insert_head(Node *head, int value) {
    Node *new = malloc(sizeof(Node));
    if (new != NULL) {
        new->data = value;
        new->next = head;
        head = new;
    } else {
        printf("Elemento %d non inserito.\n", value);
    }
    return head;
}

Node *insert_tail(Node *head, int value) {
    Node *new = malloc(sizeof(Node));
    if (new != NULL) {
        new->data = value;
        new->next = NULL;

        if (head == NULL) {
            return new;
        }

        Node *curr = head;
        while (curr->next != NULL) {
            curr = curr->next;
        }
        curr->next = new;
    } else {
        printf("Elemento %d non inserito.\n", value);
    }
    return head;
}

Node *delete_node(Node *head, int value) {
    if (head == NULL) return NULL;

    if (head->data == value) {
        Node *temp = head;
        head = head->next;
        
        free(temp);
        return head;
    }

    Node *prev = head;
    Node *curr = head->next;

    while (curr != NULL) {
        if (curr->data == value) {
            prev->next = curr->next;

            free(curr);
            return head;
        }

        prev = curr;
        curr = curr->next;
    }

    return head;
}

int count_elements(Node *head, int value) {
    int counter = 0;
    while (head != NULL) {
        if (head->data == value) {
            counter++;
        }
        head = head->next;
    }
    return counter;
}

Node *modify_list(Node *head) {
    Node *curr = head;
    while (curr != NULL) {
        curr->data *= curr->data;
        curr = curr->next;
    }
    return head;
}

void print_list(Node *head) {
    while (head != NULL) {
        printf("%d ", head->data);
        head = head->next;
    }
    printf("\n");
}
