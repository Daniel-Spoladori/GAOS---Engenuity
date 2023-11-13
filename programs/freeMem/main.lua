<<<<<<< HEAD
local totalMemory = computer.totalMemory()
local freeMemory = computer.freeMemory()
print("Total Memory: "..math.round(totalMemory / 1024).."Kb")
print("Used Memory: "..math.round((totalMemory - freeMemory)/1024).."Kb")
=======
local totalMemory = computer.totalMemory()
local freeMemory = computer.freeMemory()
print("Total Memory: "..math.round(totalMemory / 1024).."Kb")
print("Used Memory: "..math.round((totalMemory - freeMemory)/1024).."Kb")
>>>>>>> 601d924aa6a895f811c0eaa6be30a37f0ecb9382
print("Free Memory: "..math.round(freeMemory/1024).."Kb")