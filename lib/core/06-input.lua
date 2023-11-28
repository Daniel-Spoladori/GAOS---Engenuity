-- this lib takes care of user input and interaction with OS

function terminalInput(hidePath)
    if hidePath == nil or false then
        hidePath = false
    elseif hidePath == true then
        hidePath = true
    else 
        local info = debug.getinfo(3,S1)
        error(tostring(info.short_src..":"..info.linedefined..":".." ".."Error, Try check parameters"),0) -- the 0 is for dont get wheare is THIS exactly file and this line
    end



    lineSaver = OS.currentLine -- Saves the line
    local buffer = "" -- Buffer will store everything that is being typed that will store to memory when you added a key before returning
    local done = false
    
    local functionKeys = {

        keyboard.specials,
        keyboard.keypad,
        keyboard.functions

    }

    local function checkSize()
        if OS.currentLine > resMaxY then

            invoke(gpu, "copy", 1,1,resMaxX,resMaxY,0,-1) -- Move whole screen by 1 line up
            OS.currentLine = resMaxY -- Move the current line to the last
            invoke(gpu, "fill", 1, OS.currentLine,resMaxX, 1, " ") -- Clears for dont mess up with printing

        end
    end

    local function functionHandler(key)
        if key == keyboard.specials.enter then
            out = buffer
            done = true
        end
        
        if key == keyboard.specials.back then
            buffer = buffer:sub(1, -2)
        end
    
    end




    local function details()
        invoke(gpu, "setForeground", terminal.icon.color)
        invoke(gpu, "set", 1, OS.currentLine, terminal.icon.icon)
        if hidePath == false then
            invoke(gpu, "setForeground", terminal.path.color)
            invoke(gpu, "set", #terminal.icon.icon + 1, OS.currentLine, terminal.path.path)
            invoke(gpu, "setForeground", terminal.message.color)
        else
            invoke(gpu, "setForeground", terminal.message.color)
        end
    end

    local function detailsCore()
        details()
        if hidePath == false then
            invoke(gpu, "set", #terminal.icon.icon + #terminal.path.path + 1, OS.currentLine, buffer)
            invoke(gpu, "setForeground", terminal.cursor.color)
            invoke(gpu, "set", #terminal.icon.icon + #terminal.path.path + #buffer + 1, OS.currentLine, terminal.cursor.icon)
            invoke(gpu, "setForeground", terminal.message.color) 
        else
            invoke(gpu, "set", #terminal.icon.icon + 1, OS.currentLine, buffer)
            invoke(gpu, "setForeground", terminal.cursor.color)
            invoke(gpu, "set", #terminal.icon.icon + #buffer + 1, OS.currentLine, terminal.cursor.icon)
            invoke(gpu, "setForeground", terminal.message.color)
        end
    end

    
    local function detailsPrint()
        details()
        if hidePath == false then
            invoke(gpu, "set", #terminal.icon.icon + #terminal.path.path + 1, OS.currentLine, out)
            invoke(gpu, "setForeground", terminal.message.color)
        else
            invoke(gpu, "set", #terminal.icon.icon + 1, OS.currentLine, out)
            invoke(gpu, "setForeground", terminal.message.color)
        end 
    end




    local function core()
        repeat

            checkSize()
            detailsCore()

            local state, _, ascii, keyPosition = computer.pullSignal() -- Get keyboard input
            if state == "key_down" then
                    
                for functionIndex, tables in pairs(functionKeys) do
                    for tablesIndex, value in pairs(tables) do -- For each value of function keys do
                        if keyPosition == value then -- Check if its a function key
                            functionHandler(keyPosition)
                            core() -- Return to core if its a function after handling it this will make you not print it and also execute it
                        end
                    end
                end

                buffer = buffer..string.char(ascii) 

            end
        until done
    end

    core() -- Executes core ONCE

    -- If core died or ended then it will do what is bellow
    invoke(gpu, "fill", 1, OS.currentLine ,resMaxX, 1, " ") -- Clears the Line of when you was writing

    print(detailsPrint() or "") -- Prints the details with color and without the indicator

    checkSize() -- Checks size (I dont remember why i put it here but i remember i need it srry)

    if terminal.beepsAfterInput then
        computer.beep(1200,0.05) -- If dont want i BEEPING go to /config/details.cfg and change beepsAfterInput to false
    end

    return out
end

-- function terminalInput()

--     lineSaver = OS.currentLine -- Saves the line
--     local buffer = "" -- Buffer will store everything that is being typed that will store to memory when you added a key before returning
--     local done = false
    
--     local functionKeys = {

--         keyboard.specials,
--         keyboard.keypad,
--         keyboard.functions

--     }

--     local function checkSize()
--         if OS.currentLine > resMaxY then

--             invoke(gpu, "copy", 1,1,resMaxX,resMaxY,0,-1) -- Move whole screen by 1 line up
--             OS.currentLine = resMaxY -- Move the current line to the last
--             invoke(gpu, "fill", 1, OS.currentLine,resMaxX, 1, " ") -- Clears for dont mess up with printing

--         end
--     end

--     local function functionHandler(key)
--         if key == keyboard.specials.enter then
--             out = buffer
--             done = true
--         end
        
--         if key == keyboard.specials.back then
--             buffer = buffer:sub(1, -2)
--         end
    
--     end




--     local function details()
--         invoke(gpu, "setForeground", terminal.icon.color)
--         invoke(gpu, "set", 1, OS.currentLine, terminal.icon.icon)
--         invoke(gpu, "setForeground", terminal.path.color)
--         invoke(gpu, "set", #terminal.icon.icon + 1, OS.currentLine, terminal.path.path)
--         invoke(gpu, "setForeground", terminal.message.color)
--     end

--     local function detailsCore()
--         details()
--         invoke(gpu, "set", #terminal.icon.icon + #terminal.path.path + 1, OS.currentLine, buffer)
--         invoke(gpu, "setForeground", terminal.cursor.color)
--         invoke(gpu, "set", #terminal.icon.icon + #terminal.path.path + #buffer + 1, OS.currentLine, terminal.cursor.icon)
--         invoke(gpu, "setForeground", terminal.message.color)
--     end

--     local function detailsPrint()
--         details()
--         invoke(gpu, "set", #terminal.icon.icon + #terminal.path.path + 1, OS.currentLine, out)
--         invoke(gpu, "setForeground", terminal.message.color)
--     end




--     local function core()
--         repeat

--             checkSize()
--             detailsCore()

--             local state, _, ascii, keyPosition = computer.pullSignal() -- Get keyboard input
--             if state == "key_down" then
                    
--                 for functionIndex, tables in pairs(functionKeys) do
--                     for tablesIndex, value in pairs(tables) do -- For each value of function keys do
--                         if keyPosition == value then -- Check if its a function key
--                             functionHandler(keyPosition)
--                             core() -- Return to core if its a function after handling it this will make you not print it and also execute it
--                         end
--                     end
--                 end

--                 buffer = buffer..string.char(ascii) 

--             end
--         until done
--     end

--     core() -- Executes core ONCE

--     -- If core died or ended then it will do what is bellow
--     invoke(gpu, "fill", 1, OS.currentLine ,resMaxX, 1, " ") -- Clears the Line of when you was writing

--     print(detailsPrint() or "") -- Prints the details with color and without the indicator

--     checkSize() -- Checks size (I dont remember why i put it here but i remember i need it srry)

--     if terminal.beepsAfterInput then
--         computer.beep(1200,0.05) -- If dont want i BEEPING go to /config/details.cfg and change beepsAfterInput to false
--     end

--     return out
-- end