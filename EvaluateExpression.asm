// EvaluateExpression.asm
// Compute z = 17 + x - 3y, store the result in R2
// Do not modify R0 and R1

@17       // Load constant 17 into A
D=A       // D = 17

@R0       // Go to register R0 (contains x)
D=D+M     // D = 17 + x

@R1       // Go to register R1 (contains y)
D=D-M     // D = 17 + x - y
D=D-M     // D = 17 + x - 2y
D=D-M     // D = 17 + x - 3y

@R2       // Go to register R2
M=D       // Store final result in R2

(END)
@END
0;JMP     // Infinite loop to stop program
