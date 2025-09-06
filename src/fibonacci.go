// vim: ft=go sw=4 ts=4 et
package main

import (
	"fmt"
)

func fibonacciIterative(n int64) int {
	if n <= 1 {
		return 1
	}

	fib := make([]int64, n+1)
	fib[0] = 0
	fib[1] = 1

	var i int64

	for i = 2; i <= n; i++ {
		fib[i] = fib[i-1] + fib[i-2]
		println(fib[i])
	}
	return 0
}

func main() {
    var n int64

	fmt.Println("Please provide a number as argument.")
    fmt.Scan(&n) // Reads a string until whitespace

	fibonacciIterative(n)
}
