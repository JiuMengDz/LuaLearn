function readonly(t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function(_, k, v)
            error("Attempt to update a read-only table")
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

days = readonly{"Monday","Tuesday","Wednesday"}
print(days[2])
das[2] = "None"
