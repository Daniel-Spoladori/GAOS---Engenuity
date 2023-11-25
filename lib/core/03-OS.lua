-- This lib takes care of basics OS functions

function wait(seconds)
    local start = computer.uptime()
    while computer.uptime() - start < seconds do
        computer.pullSignal(seconds - (computer.uptime() - start))
    end
end

-- function milis(miliseconds)

-- end