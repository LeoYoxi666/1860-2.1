// Xor.asm
// 计算 R0 XOR R1 并存入 R2，不修改 R0 和 R1

@R0
D=M      // D = R0
@R1
D=D|M    // D = R0 OR R1 (A OR B)

@R0
A=M
D=!D     // D = NOT (R0 OR R1)
@R1
D=D&M    // D = NOT (R0 OR R1) AND R1

@R2
M=D      // R2 = R0 XOR R1
(END)
@END
0;JMP    // 无限循环，防止意外执行其他指令
