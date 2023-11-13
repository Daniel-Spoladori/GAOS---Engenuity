function input()
    local buffer = ""
    local lineSaver = OS.currentLine
    local done = false
    local functionKeys = {
        keyboard.specials,
        keyboard.keypad,
        keyboard.functions
    }
    
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


    local function core()
        repeat
            OS.currentLine = lineSaver
            invoke(gpu,"fill",1,OS.currentLine,math.huge,2, " ") -- clears for update the next value
            print (">"..buffer.."⬜")

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
    return out
end