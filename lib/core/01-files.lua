local address, invoke = computer.getBootAddress(), component.invoke
function runfile(path)
    local handle = assert(invoke(address, "open", path)) -- Handle will take care of erros and it will hold the open directory
    local chunkSize = 1024 -- Chunk size (smaller less memory waste but slower bigger fast but more waste of memory)
    local data = ""
    repeat
        local chunk = invoke(address, "read", handle, chunkSize) -- Read data stored in files by chuncks
        data = data .. (chunk or "") -- Concatenate the data variable with chunck
    until not chunk
    invoke(address, "close", handle) -- Closes the open file
    local loaded, reason = load(data, "=" .. path, "bt") -- Load globally everything loaded
    if reason then error(reason) else return loaded() end
end

function require(file)
    local found = false
    for i,v in pairs(OS.requirePaths) do
        if invoke(address, "exists", v .. file) then
            found = true
            runfile(v .. file)
            break
        else
            
        end
    end
    if not found then error ("404: File not found") end
end