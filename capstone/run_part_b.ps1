# Run in the project folder:  .\run_part_b.ps1
# It pauses after each step so you can take a screenshot.
python assembler.py --self-test
Read-Host "SCREENSHOT 1 (self-test). Press Enter for next"
foreach ($f in "Add","Max","Rect","Pong") {
    python assembler.py "test_programs\$f.asm"
    Read-Host "SCREENSHOT for $f (optional: one combined shot is fine). Press Enter for next"
}
python assembler.py Box.asm
Get-Content symbols.txt
Read-Host "SCREENSHOT: Box assembled + symbols.txt shown above. Press Enter to finish"
