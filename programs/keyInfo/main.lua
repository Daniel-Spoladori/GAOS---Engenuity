print("Press any key to get info about it")
while true do
local state, kbrd, ascii, keyPos = computer.pullSignal()
clearTerminal()
OS.currentLine = 0
    print("Keyboard: "..kbrd)
    print("State: "..state)
    print("ASCII: "..ascii)
    print("keyPosition: "..keyPos)
    print("")
    print("")
    print("")
end