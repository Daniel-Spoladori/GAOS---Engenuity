function basicinput()
    lineSaver = OS.currentLine
    local buffer = ""
    local done = false
    local functionKeys = {
        keyboard.specials,
        keyboard.keypad,
        keyboard.functions
    }
    local function checkSize()
        if OS.currentLine > resMaxY then
            invoke(gpu, "copy", 1,1,resMaxX,resMaxY,0,-1)
            OS.currentLine = resMaxY
            invoke(gpu, "fill", 1, OS.currentLine,resMaxX, 1, " ")
        end
    end
    local function functionHandler(key)
        if key == keyboard.specials.enter then
            out = buffer
            done = true
            
        end
    
        if key == keyboard.specials.space then
            buffer = buffer.." "
        end
        
        if key == keyboard.specials.back then
            buffer = buffer:sub(1, -2)
        end
    
    end
    
    local function details()
        invoke(gpu, "setForeground", terminal.icon.color)
        invoke(gpu, "set", 1, OS.currentLine, terminal.icon.icon)
        invoke(gpu, "setForeground", terminal.path.color)
        invoke(gpu, "set", #terminal.icon.icon + 1, OS.currentLine, terminal.path.path)
        invoke(gpu, "setForeground", terminal.message.color)
    end

    local function detailsCore()
        details()
        invoke(gpu, "set", #terminal.icon.icon + #terminal.path.path + 1, OS.currentLine, buffer)
        invoke(gpu, "setForeground", terminal.cursor.color)
        invoke(gpu, "set", #terminal.icon.icon + #terminal.path.path + #buffer + 1, OS.currentLine, terminal.cursor.icon)
        invoke(gpu, "setForeground", terminal.message.color)
    end

    local function detailsPrint()
        details()
        invoke(gpu, "set", #terminal.icon.icon + #terminal.path.path + 1, OS.currentLine, out)
        invoke(gpu, "setForeground", terminal.message.color)
    end


    local function core()
        repeat
            checkSize()
            -- OS.currentLine = lineSaver
            -- invoke(gpu, "set", 1,OS.currentLine, ">"..buffer.."⬜")
                        -- OS.currentLine = lineSaver
            -- print(OS.currentLine,">"..buffer.."⬜")

            detailsCore()


            local state, _, ascii, keyPosition = computer.pullSignal() -- Get keyboard input
            if state == "key_down" then
                for functionIndex, tables in pairs(functionKeys) do
                    for tablesIndex, value in pairs(tables) do -- for each value of function keys do
                        -- print(value.."   "..keyPosition)
                        if keyPosition == value then -- check if its a function key
                            functionHandler(keyPosition)
                            core()
                        end
                    end
                end
                buffer = buffer..string.char(ascii) 
            end
        until done
    end
    core()
    invoke(gpu, "fill", 1, OS.currentLine ,resMaxX, 1, " ")

    print(detailsPrint() or "")

    checkSize()
    computer.beep(1200,0.001)
    return out
end