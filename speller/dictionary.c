// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

// TODO: Choose number of buckets in hash table
const unsigned int N = 26;

// Hash table
node *table[N];
int wordnum=0;

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // TODO:

    node *n=table[hash(word)];
    while(n->next!=NULL){
        if(strcasecmp(n->word,word)==0){
            return true;
        }
        n=n->next;
    }

    if(strcasecmp(n->word,word)==0){
        return true;
    }
    return false;

}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function
    return toupper(word[0]) - 'A';
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // TODO:
    char *dicword=malloc(LENGTH);
    FILE *file=fopen(dictionary,"r");
    if(file==NULL){
        return false;
    }

    while(fscanf(file,"%s",dicword)!=EOF){
        node *n=malloc(sizeof(node));
        if(n==NULL){
            return false;
        }
        n->next=table[hash(dicword)];
        strcpy(n->word,dicword);
        wordnum++;
        table[hash(dicword)]=n;
    }
    fclose(file);
    free(dicword);
    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    // TODO:
    return wordnum;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO:

    node *n;
    node *tmp;
    for(int i=0;i<N;i++){
        if(table[i]==NULL){
            continue;
        }
        n=table[i];
        while(n->next!=NULL){
            tmp=n;
            n=n->next;
            free(tmp);
        }
        free(n);
    }

    return true;
}
