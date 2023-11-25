-- this file will take care of loading all our libs and will make sure the OS work noice

local prefix, sufix = " : >> ", "Loaded with sucess!" -- Prefix and sufix of loaded message

local address, invoke = computer.getBootAddress(), component.invoke
local gpu = component.list("gpu")()

loadlib("/config/os.cfg")

    local function printFiles(file)

        local resMaxX, resMaxY = invoke(gpu,"maxResolution")

        -- this if block is literally a tiny print function and simpler that will take care of printing our loaded files
        if OS.currentLine >= resMaxY then
            OS.currentLine = OS.currentLine - 1 -- moves pointer up
            invoke(gpu,"copy",1,1,resMaxX,resMaxY,0,-1) -- move screen up
        end
        invoke(gpu,"set",1,OS.currentLine,tostring(file)..prefix..sufix) -- prints data
        OS.currentLine = OS.currentLine + 1 -- moves pointer down
    end 

for _,libPath in pairs(OS.toLoadLibPaths) do -- For each of the path do:
    for _,file in pairs(invoke(address, "list", libPath)) do -- for each content of the path do
        if invoke(address, "isDirectory", libPath.."/"..file) == false then 
            loadlib(libPath.."/"..file)
            printFiles(file)
        end
    end
end
if beepsAfterLibs then
    computer.beep() -- beeps when OS has loaded libs CAN BE DEACTIVATED IN 'details.cfg'
end