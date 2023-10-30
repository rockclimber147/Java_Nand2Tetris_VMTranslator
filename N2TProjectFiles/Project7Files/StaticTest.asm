// push constant 111
@111
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 333
@333
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 888
@888
D=A
@0
A=M
M=D
@0
M=M+1
// pop static 8
@8
D=A
@16
D=D+A
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// pop static 3
@3
D=A
@16
D=D+A
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// pop static 1
@1
D=A
@16
D=D+A
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// push static 3
@3
D=A
@16
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// push static 1
@1
D=A
@16
A=A+D
D=M
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
// push static 8
@8
D=A
@16
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
