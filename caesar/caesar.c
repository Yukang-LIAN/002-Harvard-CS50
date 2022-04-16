#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

string rotate(string plaintext, int key);

int main(int argc, string argv[])
{
    if(argv[1]==NULL){
        printf("Usage: ./caesar key\n");
        return 1;
    }
    if(argv[2]!=NULL){
        printf("Usage: ./caesar key\n");
        return 1;
    }
    for(int i=0;i<strlen(argv[1]);i++){
        if(isalpha(argv[1][i])){
          printf("Usage: ./caesar key\n");
          return 1;
        }
    }
    int key=atoi(argv[1]);
    string plaintext=get_string("plaintext: ");
    string ciphertext=rotate(plaintext,key);
    printf("ciphertext: %s\n",ciphertext);

}

string rotate(string plaintext, int key){
    int n = strlen(plaintext);
    for(int i=0;i<n;i++){
        if(isalpha(plaintext[i])){
            if(isupper(plaintext[i])){
                plaintext[i]=(plaintext[i]-65+key)%26+65;
                printf("%c",plaintext[i]);
            }
            if(islower(plaintext[i])){
                plaintext[i]=(plaintext[i]-97+key)%26+97;
            }
        }

    }
    return plaintext;
}
