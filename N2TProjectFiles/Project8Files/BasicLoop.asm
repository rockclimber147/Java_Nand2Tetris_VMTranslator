// push constant 0
@0
D=A
@0
A=M
M=D
@0
M=M+1
// pop local 0         // initializes sum = 0
@0
D=A
@1
D=D+M
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// label LOOP_START
(LOOP_START)
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
// push local 0
@0
D=A
@1
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
// pop local 0	        // sum = sum + counter
@0
D=A
@1
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
// pop argument 0      // counter--
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
// if-goto LOOP_START  // If counter != 0, goto LOOP_START
@0
AM=M-1
D=M
@LOOP_START
D;JNE
// push local 0
@0
D=A
@1
A=M
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
