# TODO
import cs50

def main():

    while True:
        cents=100*cs50.get_float("Change owed:")
        if(cents>0):
            break

    quarters=calculate_quarters(cents)
    cents=cents-quarters*25

    dimes=calculate_dimes(cents)
    cents=cents-dimes*10

    nickels=calculate_nickels(cents)
    cents=cents-nickels*5

    pennies=calculate_pennies(cents)
    cents=cents-pennies*1

    total=quarters+dimes+nickels+pennies
    total=int(total)

    print(total)

def calculate_quarters(cents):

    quarters=cents//25
    return quarters

def calculate_dimes(cents):

    dimes=cents//10
    return dimes

def calculate_nickels(cents):

    nickels=cents//5
    return nickels

def calculate_pennies(cents):

    return cents

if __name__ == "__main__":
    main()