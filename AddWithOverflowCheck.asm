// AddWithOverflowCheck.asm

@R0
D=M      // D = x
@R1
D=D+M    // D = x + y

@R2
M=D      // R2 = x + y

// 计算溢出
@R3
M=0      // 默认 R3 = 0（无溢出）

@R0
D=M
@POSITIVE_X
D;JGE    // 如果 x >= 0，跳转到 POSITIVE_X 处理

(NEGATIVE_X)  // x < 0
@R1
D=M
@CHECK_OVERFLOW
D;JLT    // 如果 y 也 < 0，跳转到 CHECK_OVERFLOW 处理
@END
0;JMP    // 否则不溢出，结束

(POSITIVE_X)  // x >= 0
@R1
D=M
@CHECK_OVERFLOW
D;JGE    // 如果 y 也 >= 0，跳转到 CHECK_OVERFLOW 处理
@END
0;JMP    // 否则不溢出，结束

(CHECK_OVERFLOW)
@R2
D=M
@OVERFLOW
D;JLT    // 如果 z 变负，说明溢出

@R2
D=M
@END
D;JGE    // 如果 z 还是正的，说明没有溢出，结束

(OVERFLOW)
@R3
M=1      // 标记溢出

(END)
@END
0;JMP    // 无限循环

