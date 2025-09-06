 #include <stdio.h>
 #include <stdint.h>
 #include <inttypes.h> // For PRId64, PRIu64, PRIx64
#include <stdlib.h>

 void FibonacciIterative(int n) {
    if (n <= 0) {
        printf("Invalid input: Number of terms must be positive.\n");
        return;
    }

    uint64_t first = 0;
    uint64_t second = 1;
    uint64_t next= 0;

    printf("Fibonacci Series: ");

    for (uint64_t i = 0; i < n; i++) {
        if (i == 0) {
            printf("%" PRId64 "\n", first);
        } else if (i == 1) {
            printf("%" PRId64 "\n", second);
        } else {
            next = first + second;
            printf("%" PRId64 "\n", next);
            first = second;
            second = next;
        }
    }
    printf("\n");
}

int main() {
    char input[20];
    printf("Enter the number of Fibonacci terms to generate: ");
    scanf("%19s", input);
    int num_terms = (int)strtol(input, NULL, 10);
    FibonacciIterative(num_terms);
    return 0;
}
