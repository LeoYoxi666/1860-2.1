// AbsoluteValue.asm
// 计算 |R0| 存入 R1，并设置标志 R2、R3

@R0
D=M      // D = R0
@R2
M=0      // R2 = 0 (默认非负)

@R3
M=0      // R3 = 0 (默认绝对值可计算)

// 检查符号位
@R0
D=M
@NEGATIVE
D;JLT    // 如果 R0 < 0，跳转到 NEGATIVE 处理

// R0 为非负数，直接赋值
@R0
D=M
@R1
M=D
@END
0;JMP

(NEGATIVE)
// R0 为负数，设置 R2 = 1
@R2
M=1

// 计算 -R0 = ~R0 + 1
@R0
D=M
D=-D     // D = -R0

@R1
M=D      // R1 = -R0

(END)
@END
0;JMP    // 无限循环，防止执行其他代码
