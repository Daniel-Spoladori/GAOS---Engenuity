local prefix, loadedMessage = " : >> ", "Loaded with sucess!"

local address, invoke = computer.getBootAddress(), component.invoke
local gpu = component.list("gpu")()

loadlib("/config/os.cfg")

    local function debug(file)

        local resMaxX, resMaxY = invoke(gpu,"maxResolution")

        if OS.currentLine >= resMaxY then
            OS.currentLine = OS.currentLine - 1
            invoke(gpu,"copy",1,1,resMaxX,resMaxY,0,-1)
        end
        invoke(gpu,"set",1,OS.currentLine,tostring(file)..prefix..loadedMessage)
        OS.currentLine = OS.currentLine + 1
    end 

for _,libPath in pairs(OS.toLoadLibPaths) do -- For each of the path do:
    for _,file in pairs(invoke(address, "list", libPath)) do -- for each content of the path do
        if invoke(address, "isDirectory", libPath.."/"..file) == false then 
            loadlib(libPath.."/"..file)
            debug(file)
        end
    end
end
computer.beep()