# Nand2Tetris Capstone — Make the Computer Draw a Box

**Student:** Ghanishtha Bhardwaj  
**Roll number:** 2501730296  
**University:** K.R. Mangalam University — School of Engineering and Technology  
**Course:** Nand to Tetris – I (ETCCNT301)  
**Personal number K:** 96 (last two digits of the roll number)

## Part A — Hardware integration
- `CPU.hdl`, `Memory.hdl`, `Computer.hdl`

Validated with the official `CPU.tst`, `Memory.tst`, `ComputerAdd.tst`, `ComputerMax.tst` and `ComputerRect.tst`. Evidence: `ScreenShots/PART-A/`.

## Part B — Python Hack assembler
`assembler.py`: source cleaning, two-pass translation, predefined symbols, variable allocation (RAM 16, 17, ...).

Extra feature for K mod 3 = 0: every label and variable is saved with its address in `symbols.txt` (written next to the assembled file). It also reports invalid lines as `Line n: ...` instead of crashing.

```powershell
python .\assembler.py --self-test
python .\assembler.py Box.asm
```

Output was compared with the official assembler for `Add.asm`, `Max.asm`, `Rect.asm`, `Pong.asm`. Evidence: `ScreenShots/PART-B/`.

## Part C — Box program (K = 96)
- Starts at row 96 (rows 96–115), 20 rows tall.
- Width = 16 × ((96 mod 4) + 1) = 16 px = 1 word.
- First word address = SCREEN + 32 × 96 = 19456.
- `Box.asm` (source) and `Box.hack` (43 instructions, made by `assembler.py`). Run in the CPU Emulator. Evidence: `ScreenShots/PART-C/`.
