do
    local addr, invoke = computer.getBootAddress(), component.invoke
    local gpu,screen = component.list("gpu")(), component.list("screen")()
    local resMaxX, resMaxY = invoke(gpu,"maxResolution")
    invoke(gpu, "setResolution", resMaxX, resMaxY)

    function clearTerminal()
        invoke(gpu, "fill", 0, 0 ,resMaxX+1, resMaxY+1, " ")
    end
    function print(arg)
        if OS.currentLine >= resMaxY + 1 then
            OS.currentLine = OS.currentLine - 1
            invoke(gpu, "copy", 1, 1, resMaxX, resMaxY, 0, -1)
        end

        invoke(gpu, "set", 1, OS.currentLine, tostring(arg))
        OS.currentLine = OS.currentLine + 1
    end
end
