loadlib("/config/phrases.cfg")
clearTerminal()
-- for _,v in pairs()
while true do
    ----------------------------------------------------------------------------------------------------------------------------------------
    local resMaxX, resMaxY = invoke(gpu, "maxResolution") -- saves the max size of monitor
    
    function header()
        invoke(gpu, "set", 1 ,1, "GAOS - ENGENUITY ".."Version: V".. OS.version) -- title
        invoke(gpu, "set", 1, 2, tostring(motivationalPhrases[math.random(1, #motivationalPhrases)])) -- its working! dont toutch! RULE nº? OF PROGRAMMING
        invoke(gpu, "fill", 1, 3, resMaxX, 1, "-") -- divisory
        invoke(gpu, "set", 1 ,4, "Type 'help' for help.")
    end

    function Terminal()
        while true do
            local wordInp = basicinput()
            -- print("inp = :"..wordInp) --debug purpse

        end
    end

    clearTerminal()
    header()
    OS.currentLine = 5 -- with a hard coded mothod and unneficient this will jump to the next line wheare terminal starts and will be line bellow the header
    Terminal()
    wait(0.00001) -- protects from crashing (equivalent to os.sleep(0))
end