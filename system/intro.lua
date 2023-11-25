-- this file is a intro for the OS you are allowed to change how you want and even disable it BUT if you keep it on for public use PLZ give credits but its optional however i would like

local invoke, shell = component.invoke, component.shell
local gpu, screen = component.list("gpu")(), component.list("screen")()

if not screen or not gpu then error("No video source found") end -- this will crash the computer if dont have any video source

local resMaxX, resMaxY = invoke(gpu, "maxResolution") -- saves the max size of monitor

invoke(screen, "turnOn")
invoke(gpu, "setResolution", resMaxX, resMaxY)
invoke(gpu, "fill", 0, 0 ,resMaxX+1, resMaxY+1, " ")

invoke(gpu, "set", 1 , 1, "Welcome to GAOS - Engenuity!")
invoke(gpu, "set", 1 , 3, "This is a OS made by Gato100Mal.")
invoke(gpu, "set", 1 , 4, "Any erros or suggestion DM me.")
invoke(gpu, "set", 1 , 5, "Many updates coming!!!")
invoke(gpu, "set", 1 , 7, "Type 'help' for help and commands.")
invoke(gpu, "set", 1 , 9, "Press anything for continue.")
computer.pullSignal()
invoke(gpu, "fill", 1 , 1, resMaxX+1, resMaxY+1, " ")
