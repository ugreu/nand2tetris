// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
    @i
    M=0 // 初期値i=0
    @R2
    M=0 // R2を先に0にしておく
(LOOP)
    @i
    D=M
    @0
    D=M-D // R0-i
    @END
    D;JEQ // if(R0-i == 0) then END
    @1
    D=M // R1
    @2
    M=M+D // R2=R2+R1, R0の回数分R1をR2に足していく(乗算)
    @i
    M=M+1 // インクリメント
    @LOOP
    0;JMP
(END)
    @END
    0;JMP
