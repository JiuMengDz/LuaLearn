local metaTB = require("moduleA")
s1 = metaTB.new{10,20,30,50}
s2 = metaTB.new{30,1}
s3 = (s1 + s2)*s1
print(metaTB.tostring(s3))

print()
