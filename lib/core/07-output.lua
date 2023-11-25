-- this lib takes care of outputing data of the OS example: printing

do
    invoke(gpu, "setResolution", resMaxX, resMaxY) -- Makes sure that the computer is in max resolution possible


    function clearTerminal()
        invoke(gpu, "fill", 0, 0 ,resMaxX+1, resMaxY+1, " ") -- clears whole screen
    end


    function print(arg)
        if OS.currentLine >= resMaxY + 1 then
            OS.currentLine = OS.currentLine - 1
            invoke(gpu, "copy", 1, 1, resMaxX, resMaxY, 0, -1) -- moves screen 1 line up
        end

        invoke(gpu, "set", 1, OS.currentLine, tostring(arg)) -- prints the data
        OS.currentLine = OS.currentLine + 1 -- increment the "pointer"
    end
end
