#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *next;
} Node;

void *new_list(int value) {
    Node *head = NULL;
    head = malloc(sizeof(Node));

    if (head != NULL) {
        head->data = value;
        head->next = NULL;
    } else {
        printf("Lista non creata.\n");
    }
    return head;
}

Node *insert_head(Node *head, int value) {
    Node *new = NULL;
    new = malloc(sizeof(Node));

    if (new != NULL) {
        new->data = value;
        head = head->next;
        head = new;
    } else {
        printf("Elemento %d non inserito.\n", value);
    }
    return head;
}

void print_list(Node *head) {
    while (head != NULL) {
        printf("%d\n", head->data);
        head = head->next;
    }
}

void insert_tail(Node *head, int value) {
    Node *new = malloc(sizeof(Node));

    if (new != NULL) {
        new->data = value;
        new->next = NULL;

        while (head != NULL) {
            head = head->next;
        }
        head->next = new;
    } else {
        printf("Elemento non inserito.\n");
    }
}

int main(void) {
    Node *head = NULL;
    head = malloc(sizeof(Node));

    head = new_list(4);

    print_list(head);


    return 0;
}