@256
D=A
@0
M=D
@1
MD=-1
@2
MD=D-1
@3
MD=D-1
@4
MD=D-1
@Sys.init$ret.0
D=A
@0
A=M
M=D
@0
M=M+1
@1
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=M
M=D
@0
M=M+1
@3
D=M
@0
A=M
M=D
@0
M=M+1
@4
D=M
@0
A=M
M=D
@0
M=M+1
@0
D=M
@2
M=D
@5
D=A
@2
M=M-D
@0
D=M
@1
M=D
@Sys.init
0;JMP
(Sys.init$ret.0)
// function Class1.set 0
(Class1.set)
@0
D=M
@1
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
// pop static 0
@0
AM=M-1
D=M
@Class10
M=D
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
// pop static 1
@0
AM=M-1
D=M
@Class11
M=D
// push constant 0
@0
D=A
@0
A=M
M=D
@0
M=M+1
// return
@1
D=M
@13
M=D
@5
D=A
@13
D=M-D
A=D
D=M
@14
M=D
@0
AM=M-1
D=M
@2
A=M
M=D
@2
D=M+1
@0
M=D
@13
M=M-1
A=M
D=M
@4
M=D
@13
M=M-1
A=M
D=M
@3
M=D
@13
M=M-1
A=M
D=M
@2
M=D
@13
M=M-1
A=M
D=M
@1
M=D
@14
A=M
0;JMP
// function Class1.get 0
(Class1.get)
@0
D=M
@1
M=D
// push static 0
@Class10
D=M
@0
A=M
M=D
@0
M=M+1
// push static 1
@Class11
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
// return
@1
D=M
@13
M=D
@5
D=A
@13
D=M-D
A=D
D=M
@14
M=D
@0
AM=M-1
D=M
@2
A=M
M=D
@2
D=M+1
@0
M=D
@13
M=M-1
A=M
D=M
@4
M=D
@13
M=M-1
A=M
D=M
@3
M=D
@13
M=M-1
A=M
D=M
@2
M=D
@13
M=M-1
A=M
D=M
@1
M=D
@14
A=M
0;JMP





// function Class2.set 0
(Class2.set)
@0
D=M
@1
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
// pop static 0
@0
AM=M-1
D=M
@Class20
M=D
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
// pop static 1
@0
AM=M-1
D=M
@Class21
M=D
// push constant 0
@0
D=A
@0
A=M
M=D
@0
M=M+1
// return
@1
D=M
@13
M=D
@5
D=A
@13
D=M-D
A=D
D=M
@14
M=D
@0
AM=M-1
D=M
@2
A=M
M=D
@2
D=M+1
@0
M=D
@13
M=M-1
A=M
D=M
@4
M=D
@13
M=M-1
A=M
D=M
@3
M=D
@13
M=M-1
A=M
D=M
@2
M=D
@13
M=M-1
A=M
D=M
@1
M=D
@14
A=M
0;JMP
// function Class2.get 0
(Class2.get)
@0
D=M
@1
M=D
// push static 0
@Class20
D=M
@0
A=M
M=D
@0
M=M+1
// push static 1
@Class21
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
// return
@1
D=M
@13
M=D
@5
D=A
@13
D=M-D
A=D
D=M
@14
M=D
@0
AM=M-1
D=M
@2
A=M
M=D
@2
D=M+1
@0
M=D
@13
M=M-1
A=M
D=M
@4
M=D
@13
M=M-1
A=M
D=M
@3
M=D
@13
M=M-1
A=M
D=M
@2
M=D
@13
M=M-1
A=M
D=M
@1
M=D
@14
A=M
0;JMP





// function Sys.init 0
(Sys.init)
@0
D=M
@1
M=D
// push constant 6
@6
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 8
@8
D=A
@0
A=M
M=D
@0
M=M+1
// call Class1.set 2
@Class1.set$ret.1
D=A
@0
A=M
M=D
@0
M=M+1
@1
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=M
M=D
@0
M=M+1
@3
D=M
@0
A=M
M=D
@0
M=M+1
@4
D=M
@0
A=M
M=D
@0
M=M+1
@0
D=M
@2
M=D
@7
D=A
@2
M=M-D
@0
D=M
@1
M=D
@Class1.set
0;JMP
(Class1.set$ret.1)
// pop temp 0 // Dumps the return value
@0
D=A
@5
D=D+A
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// push constant 23
@23
D=A
@0
A=M
M=D
@0
M=M+1
// push constant 15
@15
D=A
@0
A=M
M=D
@0
M=M+1
// call Class2.set 2
@Class2.set$ret.2
D=A
@0
A=M
M=D
@0
M=M+1
@1
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=M
M=D
@0
M=M+1
@3
D=M
@0
A=M
M=D
@0
M=M+1
@4
D=M
@0
A=M
M=D
@0
M=M+1
@0
D=M
@2
M=D
@7
D=A
@2
M=M-D
@0
D=M
@1
M=D
@Class2.set
0;JMP
(Class2.set$ret.2)
// pop temp 0 // Dumps the return value
@0
D=A
@5
D=D+A
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
// call Class1.get 0
@Class1.get$ret.3
D=A
@0
A=M
M=D
@0
M=M+1
@1
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=M
M=D
@0
M=M+1
@3
D=M
@0
A=M
M=D
@0
M=M+1
@4
D=M
@0
A=M
M=D
@0
M=M+1
@0
D=M
@2
M=D
@5
D=A
@2
M=M-D
@0
D=M
@1
M=D
@Class1.get
0;JMP
(Class1.get$ret.3)
// call Class2.get 0
@Class2.get$ret.4
D=A
@0
A=M
M=D
@0
M=M+1
@1
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=M
M=D
@0
M=M+1
@3
D=M
@0
A=M
M=D
@0
M=M+1
@4
D=M
@0
A=M
M=D
@0
M=M+1
@0
D=M
@2
M=D
@5
D=A
@2
M=M-D
@0
D=M
@1
M=D
@Class2.get
0;JMP
(Class2.get$ret.4)
// label WHILE
(WHILE)
// goto WHILE
@WHILE
0;JMP





