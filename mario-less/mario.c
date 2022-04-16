#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int Height;
    while(true){
        Height=get_int("Height: ");
        if(Height>0 && Height<9){
            break;
        }
    }
    for(int i=0;i<Height;i++){
        for(int j=0;j<Height-i-1;j++){
            printf(" ");
        }
        for(int h=0;h<i+1;h++){
            printf("#");
        }
        printf("\n");
    }
    return 0;
}