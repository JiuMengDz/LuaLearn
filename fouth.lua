local DiQueen = require("moduleA")
tb = DiQueen.init()

DiQueen.addHead(tb, 50)
DiQueen.addHead(tb, 30)
DiQueen.addHead(tb, 10)
for i in DiQueen.genertatorValue(tb) do
    print(i)
end
