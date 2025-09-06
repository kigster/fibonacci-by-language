#include <iostream>
#include <vector> // For storing the sequence if needed

void printFibonacciIterative(int n) {
    if (n <= 0) {
        std::cout << "Please enter a positive number of terms." << std::endl;
        return;
    }
    if (n == 1) {
        std::cout << "0" << std::endl;
        return;
    }

    long long first = 0;
    long long second = 1;

    std::cout << first << " " << second << " ";

    for (int i = 2; i < n; ++i) {
        long long next = first + second;
        std::cout << next << "\n";
        first = second;
        second = next;
    }
    std::cout << std::endl;
}

int main() {
    int num_terms;
    std::cout << "Enter the number of Fibonacci terms to display: ";
    std::cin >> num_terms;
    printFibonacciIterative(num_terms);
    return 0;
}
