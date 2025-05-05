// Xor.asm
// Compute element-wise XOR (z = x XOR y) using basic logic gates
// z is stored in R2, do not change R0 or R1

@R0
D=!M      // D = NOT x

@R1
D=D&M     // D = (NOT x) AND y

@R2
M=D       // Store intermediate result (Part A) in R2

@R1
D=!M      // D = NOT y

@R0
D=D&M     // D = (NOT y) AND x

@R2
M=D|M     // Final result: (¬x∧y) ∨ (¬y∧x) = x XOR y
