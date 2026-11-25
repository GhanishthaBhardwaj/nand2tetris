// Box.asm - Nand2Tetris capstone, Ghanishtha Bhardwaj, Roll No. 2501730296, K = 96
// While any key is pressed: draw a black box. When released: clear it.
// Box: starts at row K = 96, 20 rows tall, 16 * ((96 mod 4) + 1) = 16 px = 1 word wide.
// First word address = SCREEN + 32*96 = 16384 + 3072 = 19456.
// R12 = colour (-1 black / 0 white), R13 = screen pointer,
// R14 = row counter, R15 = word counter.

(LOOP)
    @KBD
    D=M
    @SET_BLACK
    D;JNE           // key pressed -> black

(SET_WHITE)
    @R12
    M=0             // no key -> white
    @FILL_SETUP
    0;JMP

(SET_BLACK)
    @R12
    M=-1

(FILL_SETUP)
    @19456          // SCREEN + 32*96
    D=A
    @R13
    M=D
    @20             // 20 rows
    D=A
    @R14
    M=D

(ROW)
    @1              // 1 word per row (16 px)
    D=A
    @R15
    M=D

(WORD)
    @R12
    D=M
    @R13
    A=M
    M=D             // RAM[R13] = colour
    @R13
    M=M+1           // next word
    @R15
    MD=M-1
    @WORD
    D;JGT           // more words in this row?

    @31             // skip the other 32 - 1 = 31 words of the row
    D=A
    @R13
    M=D+M
    @R14
    MD=M-1
    @ROW
    D;JGT           // more rows?

    @LOOP
    0;JMP
