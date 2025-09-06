# vim: ft=asm
.global _fibonacci_iterative
_fibonacci_iterative:
    ; x0 contains n (the desired Fibonacci number index)

    cmp x0, #0
    beq .L_fib_zero

    cmp x0, #1
    beq .L_fib_one

    ; Initialize a = F(0) = 0, b = F(1) = 1
    mov x1, #0  ; a
    mov x2, #1  ; b
    mov x3, #2  ; counter, starting from F(2)

.L_loop:
    cmp x3, x0
    bge .L_end_loop

    ; Calculate next Fibonacci number: next_fib = a + b
    add x4, x1, x2

    ; Update a and b for the next iteration
    mov x1, x2  ; new a is old b
    mov x2, x4  ; new b is next_fib

    add x3, x3, #1 ; increment counter
    b .L_loop

.L_end_loop:
    mov x0, x2  ; Result is in x2 (the last calculated 'b')
    ret

.L_fib_zero:
    mov x0, #0
    ret

.L_fib_one:
    mov x0, #1
    ret
