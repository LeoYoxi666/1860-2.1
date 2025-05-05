// AddWithOverflowCheck.asm
// Compute z = x + y and store in R2
// If overflow occurs, set R3 = 1, else R3 = 0

@R0
D=M       // D = x

@R1
D=D+M     // D = x + y

@R2
M=D       // Store result (z) in R2

@R3
M=0       // Assume no overflow (R3 = 0)

@R0
D=M       // Load x to check sign
@POSITIVE_X
D;JGE     // If x >= 0, go to POSITIVE_X case

// x < 0 case
@R1
D=M       // Load y to check sign
@CHECK_OVERFLOW
D;JLT     // If y < 0, possible overflow
@END
0;JMP     // If y >= 0, no overflow

(POSITIVE_X)
// x >= 0 case
@R1
D=M       // Load y to check sign
@CHECK_OVERFLOW
D;JGE     // If y >= 0, possible overflow
@END
0;JMP     // If y < 0, no overflow

(CHECK_OVERFLOW)
@R2
D=M       // Load result (x + y)
@OVERFLOW
D;JLT     // If result is negative → overflow
@END
D;JGE     // Else no overflow

(OVERFLOW)
@R3
M=1       // Set overflow flag to 1

(END)
@END
0;JMP     // Infinite loop to stop execution
