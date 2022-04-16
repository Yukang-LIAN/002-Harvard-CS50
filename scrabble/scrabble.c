#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>

// Points assigned to each letter of the alphabet
int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int compute_score(string word);

int main(void)
{
    // Get input words from both players
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");

    // Score both words
    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    // TODO: Print the winner
    //printf("%d\n",score1);
    //printf("%d\n",score2);

    if (score1 == score2){
        printf("Tie!\n");
    }
    if (score1 > score2){
        printf("Player 1 wins!\n");
    }
    if (score1 < score2){
        printf("Player 2 wins!\n");
    }
}

int compute_score(string word)
{
    // TODO: Compute and return score for string
    int s = strlen(word);
    int sum = 0;
    for(int i = 0; i < s; i++){
        int num = 0;
        if (isupper(word[i])){
            num = word[i] - 65;
            sum = sum + POINTS[num];
        }

        if (islower(word[i])){
            num = word[i]-97;
            sum = sum + POINTS[num];
        }
        else{
            num=0;
            sum=sum+num;
        }
    }
    return sum;
}
