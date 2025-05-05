// AbsoluteValue.asm
// Compute the absolute value of x (stored in R0)
// Store |x| in R1, set flags in R2 and R3
// R2 = 1 if x < 0, else 0
// R3 = 1 if abs(x) is not representable in 2's complement

@R2
M=0       // R2 = 0 (assume x is not negative)

@R3
M=0       // R3 = 0 (assume abs(x) is representable)

@R0
D=M       // D = x

@NEGATIVE
D;JLT     // If x < 0, jump to NEGATIVE to compute -x

// Case: x >= 0
@R0
D=M       // Load x again
@R1
M=D       // R1 = x (no need to negate)
@END
0;JMP     // End program

(NEGATIVE)
// Case: x < 0
@R2
M=1       // Set R2 = 1 to indicate x was negative

@R0
D=M
D=-D      // D = -x = ~x + 1 (2's complement negation)

@R1
M=D       // Store |x| in R1

// Check if x == -x (this only happens for -32768)
@R0
D=M
@R1
D=D-M
@END
D;JEQ     // If x == -x, overflow → jump to END after setting R3

@END
0;JMP     // No overflow, finish execution

@R3
M=1       // Set R3 = 1 → absolute value not representable

(END)
@END
0;JMP     // Infinite loop to halt program
