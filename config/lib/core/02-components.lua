address, invoke = computer.getBootAddress(), component.invoke
gpu, screen = component.list("gpu")(), component.list("screen")()

resMaxX, resMaxY = invoke(gpu, "maxResolution") -- saves the max size of monitor