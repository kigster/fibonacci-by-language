fn fibonacci_iterative(n: u64) -> u64 {
    // Base cases for the first two Fibonacci numbers
    if n == 0 {
        return 0;
    }
    if n == 1 {
        return 1;
    }

    let mut prev: u64 = 0;
    let mut curr: u64 = 1;

    // The loop runs `n-1` times to find the `n`th number
    for _ in 1..n {
        let next = prev + curr;
        prev = curr;
        curr = next;
        println!("{curr}");
    }

    curr
}

use std::io;

fn main() {
    println!("Please enter some text:");
    let mut input = String::new(); // Create a mutable String to store the input

    io::stdin().read_line(&mut input) // Read a line into the 'input' String
        .expect("Failed to read line");

    let n: u64 = input
        .trim()
        .parse()
        .expect("Input not an integer");
    fibonacci_iterative(n); 
}

