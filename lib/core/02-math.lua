function increment(var, amount)
    if amount == nil then 
        return var + 1
    else
        return var + amount
    end
end

function decrement(var, amount)
    if amount == nil then 
        return var - 1
    else
        return var - amount
    end

end

function between(var, val1, val2)
    if var >= val1 and var <= val2 then
        return true
    else
        return false
    end
end

math.round = function(val)
    return(math.floor(val + 0.5))
end
