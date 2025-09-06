#!/usr/bin/env python3

def fibonacci_interactive():
    """Generates the Fibonacci sequence based on user input."""

    try:
        nterms = int(input("How many terms of the Fibonacci sequence should be generated? "))
        if nterms <= 0:
            print("Please enter a positive integer.")
    except ValueError:
        print("Invalid input. Please enter a whole number.")

    n1, n2 = 0, 1
    count = 0

    print("Fibonacci sequence:")
    while count < nterms:
        print(n1, end="\n")
        nth = n1 + n2
        # Update values for the next iteration
        n1 = n2
        n2 = nth
        count += 1

if __name__ == "__main__":
    fibonacci_interactive()
