local M = {}    -- 通过table来实现模块

M.work = function(...)
    print("function working")
    for i, v in ipairs{...} do
          print(i, v)
     end
     -- do some job.
end

return M