function listNew()
    return {first = 0, last = -1}
end

function pushFirst(list, value)
    local pos = list.first - 1
    list.first = pos
    list[pos] = value
end

function pushLast(list, value)
    local pos = list.last + 1
    list.last = pos
    list[pos] = value
end

function popFirst(list)
    local pos = list.first
    if pos > list.last then
        error("It's a empty list")
    end
    local value = list[pos]
    list.first = list.first + 1
    list[pos] = nil
    return value
end

function popLast(list)
    local pos = list.last
    if pos < list.first then
        error("It's empty list")
    end
    local value = list[pos]
    list.last = list.last - 1
    list[pos] = nil
    return value
end

l = listNew()
pushLast(l, 25)
pushLast(l, 58)
pushLast(l, 89)
pushLast(l, 7)
pushFirst(l, 58)
pushFirst(l, 78)
popFirst(l)
popFirst(l)
while true do
    popLast(l)
end
popLast(l)
popLast(l)
popLast(l)
popLast(l)
popLast(l)
popLast(l)
print("Very good!")
