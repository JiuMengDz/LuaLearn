local Set = {}
local mt = {} --集合共享的元表

-- 使用指定的列表创建一个新的集合
function Set.new(l)
     local set = {}
     setmetatable(set, mt)
     for i, v in ipairs(l) do
          set[v] = true
     end
     return set
end

function Set.union(a, b)
     local res = Set.new {}
     for k in pairs(a) do
          res[k] = true
     end
     for k in pairs(b) do
          res[k] = true
     end
     return res
end

function Set.intersection(a, b)
     local res = Set.new {}
     for k in pairs(a) do
          res[k] = b[k]
     end
     return res
end

function Set.tostring(set)
     local l = {}
     for e in pairs(set) do
          l[#l + 1] = tostring(e)
     end
     return "{" .. table.concat(l, ", ") .. "}"
end

mt.__add = Set.union
mt.__mul = Set.intersection

return Set
