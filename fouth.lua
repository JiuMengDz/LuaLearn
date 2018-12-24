local list = {1, 5, 8, 6, 9, 5, 2, 1, 4, 5}

function fromto(n, m)
    local startNum = n - 1
    local endNum = m
    return function()
        startNum = startNum + 1
        if (startNum <= endNum) then
            return list[startNum]
        end
    end
end

for i in fromto(2, 8) do
    print(i)
end
