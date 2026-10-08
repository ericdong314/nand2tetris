// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
// mult x(R0) and y(R1) and save result(R2)
// initialization
// result = 0
// while x > 0:
//     result += y
//     x -= 1
// return result

@2
M=0    // result = 0

(LOOP)
@0
D=M    // D is holding x
@END
D;JEQ  // if x == 0: jump to END

@1
D=M    // D is holding y
@2
M=D+M  // result = y + result

@0
D=M    // D is holding x
M=D-1  // x = x - 1

@LOOP
0;JMP

(END)