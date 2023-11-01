clearTerminal()

-- for _,v in pairs()
while true do
    ----------------------------------------------------------------------------------------------------------------------------------------
    local resMaxX, resMaxY = invoke(gpu, "maxResolution") -- saves the max size of monitor
    
    function header()
        invoke(gpu, "set", 1 ,1, "GAOS - ENGENUITY ".."Version: V".. OS.version)
        invoke(gpu, "set", 1, 2, tostring(OS.phrases[math.random(1, #OS.phrases)]))
        invoke(gpu, "fill", 1, 3, resMaxX, 1, "-")
        OS.currentLine = 4
        print("Type 'help' for help.")
    end

    function Terminal()   
        x = input()
        print("inp = :"..x)
        -- keyboard.read()
        -- keyboard.read()

        while true do computer.beep() end
    end

    clearTerminal()
    header()
    Terminal()
    wait(1.900001) -- protects from crashing (equivalent to os.sleep(0))
end