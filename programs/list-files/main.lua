print("Type the directory for listing: ")
local input = terminalInput(true) or "/"
if invoke(address, "exists", input) then
    
    for i,v in pairs(invoke(address,"list",input)) do
        print("  ↳ " ..v)
    end

else
    print("Path not found!")
end


-- old list file (use if you are using CD as it is fully compatible)

-- if invoke(address, "exists", terminal.) then
    
--     for i,v in pairs(invoke(address,"list",terminal.path.path)) do
--         print("  ↳ " ..v)
--     end

-- else
--     print("Path not found!")
-- end