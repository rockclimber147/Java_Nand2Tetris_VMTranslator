// push constant 17
@17
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 17
@17
D=A
@0
A=M
M=D
@0
M=M+1
// eq
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@T0
D;JEQ
@0
A=M-1
M=0
(T0)
// push constant 17
@17
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 16
@16
D=A
@0
A=M
M=D
@0
M=M+1
// eq
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@T1
D;JEQ
@0
A=M-1
M=0
(T1)
// push constant 16
@16
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 17
@17
D=A
@0
A=M
M=D
@0
M=M+1
// eq
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@T2
D;JEQ
@0
A=M-1
M=0
(T2)
// push constant 892
@892
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 891
@891
D=A
@0
A=M
M=D
@0
M=M+1
// lt
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@T3
D;JLT
@0
A=M-1
M=0
(T3)
// push constant 891
@891
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 892
@892
D=A
@0
A=M
M=D
@0
M=M+1
// lt
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@T4
D;JLT
@0
A=M-1
M=0
(T4)
// push constant 891
@891
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 891
@891
D=A
@0
A=M
M=D
@0
M=M+1
// lt
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@T5
D;JLT
@0
A=M-1
M=0
(T5)
// push constant 32767
@32767
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 32766
@32766
D=A
@0
A=M
M=D
@0
M=M+1
// gt
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@T6
D;JGT
@0
A=M-1
M=0
(T6)
// push constant 32766
@32766
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 32767
@32767
D=A
@0
A=M
M=D
@0
M=M+1
// gt
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@T7
D;JGT
@0
A=M-1
M=0
(T7)
// push constant 32766
@32766
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 32766
@32766
D=A
@0
A=M
M=D
@0
M=M+1
// gt
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@T8
D;JGT
@0
A=M-1
M=0
(T8)
// push constant 57
@57
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 31
@31
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 53
@53
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
// push constant 112
@112
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
// neg
@0
A=M-1
M=-M
// and
@0
AM=M-1
D=M
A=A-1
M=M&D
// push constant 82
@82
D=A
@0
A=M
M=D
@0
M=M+1
// or
@0
AM=M-1
D=M
A=A-1
M=M|D
// not
@0
A=M-1
M=!M
