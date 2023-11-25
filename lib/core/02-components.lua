-- This lib takes care of component handling for easier typing and faster coding also for a better looking and for more memory saving

address, invoke = computer.getBootAddress(), component.invoke
gpu, screen = component.list("gpu")(), component.list("screen")()

resMaxX, resMaxY = invoke(gpu, "maxResolution") -- saves the max size of monitor