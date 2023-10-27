-- this script is made inspiring on default openOS

local address, invoke = computer.getBootAddress(), component.invoke

function loadlib(path)
    dataToRead = ""
    local handle = assert(invoke(address, "open", path)) -- handle will take care of erros and it will hold the open directory
    
    repeat
        local data = invoke(address, "read", handle, math.huge) -- read all data from that directory and saves in a variable called data
        dataToRead = dataToRead..(data or "")   
    until not data

    invoke(address, "close", handle)-- closes the directory after reading all of the file
    local loaded, reason = load(dataToRead, "=" .. path, "bt", _G) -- load the file and save data loaded and also reason of error if had in variables
    if reason then error(reason) else return loaded() end -- if has any erros it will crash the OS if dont have any erros it will return what was loaded
end

-- function loadlib(path)
--     local handle = assert(invoke(address, "open", path)) -- Handle will take care of erros and it will hold the open directory
--     local chunkSize = 128 -- Chunk size (smaller less memory waste but slower bigger fast but more waste of memory)
--     local data = ""
--     repeat
--         local chunk = invoke(address, "read", handle, chunkSize) -- Read data stored in files by chuncks
--         data = data .. (chunk or "") -- Concatenate the data variable with chunck
--     until not chunk
--     invoke(address, "close", handle) -- Closes the open file
--     local loaded, reason = load(data, "=" .. path, "bt", _G) -- Load globally everything loaded
--     if reason then error(reason) else return loaded() end
-- end

load(loadlib) -- will load the loadlib funcion that way we can use it anywhere
loadlib("/system/intro.lua")
loadlib("/system/libldr.lua")
loadlib("/system/terminal.lua")
error("Terminal died: unrecoverable error") -- if the terminal "dies" or stop working it will crash the OS
