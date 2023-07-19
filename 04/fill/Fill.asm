// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// スクリーンのベースアドレスはラベルSCREEN=16384
// このベースアドレスからポインタ操作で全ピクセルをLOOPで黒(1)にする？
// 間接アドレッシングをしたい
// 2の補数より、黒->(1111111111111111)two=(-1)ten 

(initWHITE)
    @i
    M=0
(WHITELOOP)
    @KBD
    D=M
    @initBLACK
    D;JGT
    @i
    D=M
    @8192
    D=D-A
    @initWHITE
    D;JEQ
    @i
    D=M
    // SCREENは定数なのでC命令で計算したアドレスの参照先に格納する
    @SCREEN
    A=A+D
    M=0
    @i
    M=M+1
    @WHITELOOP
    0;JMP
(initBLACK)
    @i
    M=0
(BLACKLOOP)
    @KBD
    D=M
    @initWHITE
    D;JEQ
    @i
    D=M
    @8192
    D=D-A
    @initBLACK
    D;JEQ
    @i
    D=M
    @SCREEN
    A=A+D
    M=-1
    @i
    M=M+1
    @BLACKLOOP
    0;JMP
