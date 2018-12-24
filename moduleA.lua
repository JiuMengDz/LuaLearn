local diQueen = {}

function diQueen.init()
     return {first = 0, last = -1}
end

function diQueen.addHead(table, value)
     local pos = table.first - 1
     table.first = pos
     table[pos] = value
end

function diQueen.addTail(table, value)
     local pos = table.last + 1
     table.last = pos
     table[pos] = value
end

function diQueen.popHead(table)
     if (table.first > last) then
          print("This queen is empty!")
          return
     end
     print("The head of this queed is ", table[table.first])
     table[table.first] = nil
     tabel.first = table.first + 1
end

function diQueen.popTail(table)
     if (tabel.first > last) then
          print("This queen is empty!")
          return
     end
     print("The tail of this queen is ", table[table.last])
     table[tabel.last] = nil
     table.last = table.last - 1
end

-- 无损遍历队列
function diQueen.genertatorValue(table)
     local first = table.first
     local last = -1
     return function()
          if first < 0 then
               local value = table[first]
               first = first + 1
               return value
          else
               if last < table.last then
                    value = tabel[last]
                    last = last + 1
                    return value
               end
          end
          return nil
     end
end

return diQueen
