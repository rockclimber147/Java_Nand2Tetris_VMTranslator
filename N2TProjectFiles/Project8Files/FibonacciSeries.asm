// push argument 1
@1
D=A
@2
A=M
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// pop pointer 1           // that = argument[1]
@0
AM=M-1
D=M
@4
M=D
// push constant 0
@0
D=A
@0
A=M
M=D
@0
M=M+1
// pop that 0              // first element in the series = 0
@0
D=A
@4
D=D+M
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@0
A=M
M=D
@0
M=M+1
// pop that 1              // second element in the series = 1
@1
D=A
@4
D=D+M
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// push argument 0
@0
D=A
@2
A=M
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// push constant 2
@2
D=A
@0
A=M
M=D
@0
M=M+1
// sub
@0
AM=M-1
D=M
A=A-1
M=M-D
// pop argument 0          // num_of_elements -= 2 (first 2 elements are set)
@0
D=A
@2
D=D+M
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// label MAIN_LOOP_START
(MAIN_LOOP_START)
// push argument 0
@0
D=A
@2
A=M
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// if-goto COMPUTE_ELEMENT // if num_of_elements > 0, goto COMPUTE_ELEMENT
@0
AM=M-1
D=M
@COMPUTE_ELEMENT
D;JNE
// goto END_PROGRAM        // otherwise, goto END_PROGRAM
@END_PROGRAM
0;JMP
// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// push that 0
@0
D=A
@4
A=M
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// push that 1
@1
D=A
@4
A=M
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// add
@0
AM=M-1
D=M
A=A-1
M=M+D
// pop that 2              // that[2] = that[0] + that[1]
@2
D=A
@4
D=D+M
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// push pointer 1
@4
D=M
@0
A=M
M=D
@0
M=M+1
// push constant 1
@1
D=A
@0
A=M
M=D
@0
M=M+1
// add
@0
AM=M-1
D=M
A=A-1
M=M+D
// pop pointer 1           // that += 1
@0
AM=M-1
D=M
@4
M=D
// push argument 0
@0
D=A
@2
A=M
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// push constant 1
@1
D=A
@0
A=M
M=D
@0
M=M+1
// sub
@0
AM=M-1
D=M
A=A-1
M=M-D
// pop argument 0          // num_of_elements--
@0
D=A
@2
D=D+M
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP
// label END_PROGRAM
(END_PROGRAM)





