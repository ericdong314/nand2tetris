// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

// set screen black
// addr = SCREEN
// while addr < KBD:
//    RAM[addr] = -1
//    addr += 1
(MAINLOOP)
@KBD
D=M

@BLACK
D;JNE

@WHITE
0;JMP

@MAINLOOP
0;JMP



(BLACK)
@addr
@SCREEN
D=A     // D contains SCREEN
@addr
M=D     // value of addr = SCREEN

(LOOP)
@KBD
D=M
@MAINLOOP
D;JEQ   // back to main loop if no key is pressed
@addr
D=M     // D contains value of addr
@KBD    
D=A-D   // D contains KBD - vof(addr)

@MAINLOOP
D;JEQ // end while loop if addr == KBD

@addr
A=M    // get the value of addr
M=-1   // RAM[addr] = -1

@addr
M=M+1  // addr += 1

@LOOP
0;JMP


(WHITE)
@addr
@SCREEN
D=A     // D contains SCREEN
@addr
M=D     // value of addr = SCREEN

(LOOP1)
@KBD
D=M
@MAINLOOP
D;JNE   // back to main loop if some key is pressed
@addr
D=M     // D contains value of addr
@KBD    
D=A-D   // D contains KBD - vof(addr)

@MAINLOOP
D;JEQ // end while loop if addr == KBD

@addr
A=M    // get the value of addr
M=0   // RAM[addr] = 0

@addr
M=M+1  // addr += 1

@LOOP1
0;JMP
