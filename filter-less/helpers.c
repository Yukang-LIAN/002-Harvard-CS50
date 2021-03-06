#include "helpers.h"
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    int average=0;
    for(int i=0;i<height;i++){
        for(int j=0;j<width;j++){
            average=round((image[i][j].rgbtBlue+image[i][j].rgbtGreen+image[i][j].rgbtRed)/3.0);
            image[i][j].rgbtBlue=average;
            image[i][j].rgbtGreen=average;
            image[i][j].rgbtRed=average;
        }
    }
    return;
}

int limit(int RGB)
{
    if (RGB > 255)
    {
        RGB = 255;
    }
    return RGB;
}
// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    int sepiaRed=0;
    int sepiaGreen=0;
    int sepiaBlue=0;
    for(int i=0;i<height;i++){
        for(int j=0;j<width;j++){
            sepiaRed=limit(round(.393*image[i][j].rgbtRed+.769*image[i][j].rgbtGreen+.189*image[i][j].rgbtBlue));
            sepiaGreen=limit(round(.349*image[i][j].rgbtRed+.686*image[i][j].rgbtGreen+.168*image[i][j].rgbtBlue));
            sepiaBlue=limit(round(.272*image[i][j].rgbtRed+.534*image[i][j].rgbtGreen+.131*image[i][j].rgbtBlue));
            image[i][j].rgbtBlue=sepiaBlue;
            image[i][j].rgbtGreen=sepiaGreen;
            image[i][j].rgbtRed=sepiaRed;
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{

    int res=0;
    for(int i=0;i<height;i++){
        for(int j=0;j<width/2;j++){
            res=image[i][j].rgbtRed;
            image[i][j].rgbtRed=image[i][width-1-j].rgbtRed;
            image[i][width-1-j].rgbtRed=res;
            res=image[i][j].rgbtGreen;
            image[i][j].rgbtGreen=image[i][width-1-j].rgbtGreen;
            image[i][width-1-j].rgbtGreen=res;
            res=image[i][j].rgbtBlue;
            image[i][j].rgbtBlue=image[i][width-1-j].rgbtBlue;
            image[i][width-1-j].rgbtBlue=res;
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
     int sumBlue;
    int sumGreen;
    int sumRed;
    float counter;
    //create a temporary table of colors to not alter the calculations
    RGBTRIPLE temp[height][width];

    for (int i = 0; i < width; i++)
    {
        for (int j = 0; j < height; j++)
        {
            sumBlue = 0;
            sumGreen = 0;
            sumRed = 0;
            counter = 0.00;

            // sums values of the pixel and 8 neighboring ones, skips iteration if it goes outside the pic
            for (int k = -1; k < 2; k++)
            {
                if (j + k < 0 || j + k > height - 1)
                {
                    continue;
                }

                for (int h = -1; h < 2; h++)
                {
                    if (i + h < 0 || i + h > width - 1)
                    {
                        continue;
                    }

                    sumBlue += image[j + k][i + h].rgbtBlue;
                    sumGreen += image[j + k][i + h].rgbtGreen;
                    sumRed += image[j + k][i + h].rgbtRed;
                    counter++;
                }
            }

            // averages the sum to make picture look blurrier
            temp[j][i].rgbtBlue = round(sumBlue / counter);
            temp[j][i].rgbtGreen = round(sumGreen / counter);
            temp[j][i].rgbtRed = round(sumRed / counter);
        }
    }

    //copies values from temporary table
    for (int i = 0; i < width; i++)
    {
        for (int j = 0; j < height; j++)
        {
            image[j][i].rgbtBlue = temp[j][i].rgbtBlue;
            image[j][i].rgbtGreen = temp[j][i].rgbtGreen;
            image[j][i].rgbtRed = temp[j][i].rgbtRed;
        }
    }

    return;
}
