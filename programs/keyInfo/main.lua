print("Press any key to get info about it")
while true do
local state, kbrd, ascii, keyPos = computer.pullSignal()
clearTerminal()
OS.currentLine = 1
    print("Keyboard: "..kbrd)
    print("State: "..state)
    print("ASCII: "..ascii)
    print("keyPosition: "..keyPos)
    print("")
    print("Press 'esc' to exit")
    if keyPos == 1 then
        break
    end
end
    
clearTerminal()
header()
OS.currentLine = OS.terminalStart
Terminal()