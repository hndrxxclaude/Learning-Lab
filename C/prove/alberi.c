#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int value;
    Node *left;
    Node *right;
 } Node;

Node *create_node(int value);
Node *inserisci(Node *root, int value);
Node *cerca(Node *root, int value);

int main(void) {


    return 0;
}

Node *create_node(int value) {
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
        return create_node(value);
    }

    if (value < root->value) {
        root->left = inserisci(root,value);
    } else {
        root->right = inserisci(root, value);
    }

    return root;
}

Node *cerca(Node *root, int value) {
    if (root == NULL || root->value == value) {
        return root;
    }

    if (value < root->value) {
        return cerca(root->left, value);
    } else {
        return cerca(root->right, value);
    }
}