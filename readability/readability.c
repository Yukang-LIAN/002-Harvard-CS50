#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);

int main(void)
{
    string content = get_string("Please input your contents: ");
    int letters = count_letters(content);
    int words = count_words(content);
    int sentences = count_sentences(content);
    float L , S;
    L = (float)letters/(float)words*100;
    S = (float)sentences/(float)words*100;
    //printf("%d %d %d %f %f",letters,words,sentences,L,S);
    float cal=0.0588*L-0.296*S-15.8;
    int index=(int)(cal+0.5);
    if(index<1){
        printf("Before Grade 1\n");
    }
    else if(index>=16){
        printf("Grade 16+\n");
    }
    else{
        printf("Grade %d\n",index);
    }
}

int count_letters(string text){
    int n;
    int letter_num=0;
    n=strlen(text);
    for(int i=0;i<n;i++){
        if(isalpha(text[i])){
            letter_num++;
        }
    }
    return letter_num;
}

int count_words(string text){
    int n;
    int word_num=0;
    n=strlen(text);
    for(int i=0;i<n;i++){
        if(text[i]==32){
            word_num++;
        }
    }
    word_num++;
    return word_num;
}

int count_sentences(string text){
    int n;
    int sentence_num=0;
    n=strlen(text);
    for(int i=0;i<n;i++){
        if(text[i]==33 || text[i]==46 || text[i]==63){
            sentence_num++;
        }
    }
    return sentence_num;
}