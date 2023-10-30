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
      // // Sys.vm for NestedCall test.
      // 
      // // Sys.init()
      // //
      // // Calls Sys.main() and stores return value in temp 1.
      // // Does not return.  (Enters infinite loop.)
      // 
      // function Sys.init 0
(Sys.init)
@0
D=M
@1
M=D
      // push constant 4000	// test THIS and THAT context save
@4000
D=A
@0
A=M
M=D
@0
M=M+1
      // pop pointer 0
@0
AM=M-1
D=M
@3
M=D
      // push constant 5000
@5000
D=A
@0
A=M
M=D
@0
M=M+1
      // pop pointer 1
@0
AM=M-1
D=M
@4
M=D
      // call Sys.main 0
@Sys.main$ret.1
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
@Sys.main
0;JMP
(Sys.main$ret.1)
      // pop temp 1
@1
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
      // label LOOP
(LOOP)
      // goto LOOP
@LOOP
0;JMP
      // 
      // // Sys.main()
      // //
      // // Sets locals 1, 2 and 3, leaving locals 0 and 4 unchanged to test
      // // default local initialization to 0.  (RAM set to -1 by test setup.)
      // // Calls Sys.add12(123) and stores return value (135) in temp 0.
      // // Returns local 0 + local 1 + local 2 + local 3 + local 4 (456) to confirm
      // // that locals were not mangled by function call.
      // 
      // function Sys.main 5
(Sys.main)
@0
D=M
@1
M=D
@0
A=M
M=0
@0
M=M+1
@0
A=M
M=0
@0
M=M+1
@0
A=M
M=0
@0
M=M+1
@0
A=M
M=0
@0
M=M+1
@0
A=M
M=0
@0
M=M+1
      // push constant 4001
@4001
D=A
@0
A=M
M=D
@0
M=M+1
      // pop pointer 0
@0
AM=M-1
D=M
@3
M=D
      // push constant 5001
@5001
D=A
@0
A=M
M=D
@0
M=M+1
      // pop pointer 1
@0
AM=M-1
D=M
@4
M=D
      // push constant 200
@200
D=A
@0
A=M
M=D
@0
M=M+1
      // pop local 1
@1
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
      // push constant 40
@40
D=A
@0
A=M
M=D
@0
M=M+1
      // pop local 2
@2
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
      // push constant 6
@6
D=A
@0
A=M
M=D
@0
M=M+1
      // pop local 3
@3
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
      // push constant 123
@123
D=A
@0
A=M
M=D
@0
M=M+1
      // call Sys.add12 1
@Sys.add12$ret.2
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
@6
D=A
@2
M=M-D
@0
D=M
@1
M=D
@Sys.add12
0;JMP
(Sys.add12$ret.2)
      // pop temp 0
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
      // push local 1
@1
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
      // push local 2
@2
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
      // push local 3
@3
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
      // push local 4
@4
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
      // add
@0
AM=M-1
D=M
A=A-1
M=M+D
      // add
@0
AM=M-1
D=M
A=A-1
M=M+D
      // add
@0
AM=M-1
D=M
A=A-1
M=M+D
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
      // 
      // // Sys.add12(int n)
      // //
      // // Returns n+12.
      // 
      // function Sys.add12 0
(Sys.add12)
@0
D=M
@1
M=D
      // push constant 4002
@4002
D=A
@0
A=M
M=D
@0
M=M+1
      // pop pointer 0
@0
AM=M-1
D=M
@3
M=D
      // push constant 5002
@5002
D=A
@0
A=M
M=D
@0
M=M+1
      // pop pointer 1
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
      // push constant 12
@12
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





