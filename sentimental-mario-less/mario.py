# TODO
import cs50
while True:
    try:
        height=cs50.get_int("Height: ")
        if height<9 and height>0:
            break
    except ValueError:
        print("That is not a integer!")
for i in range(0,height):
    for j in range(0,height-i-1):
        print(' ',end='')
    for h in range(0,i+1):
        print('#',end='')
    print("")