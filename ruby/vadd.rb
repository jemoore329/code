array_one = [1,2,3]
array_two = [4,5,6]
x = 0
array_three = []
while x < array_one.length
  array_three[x] = array_one[x] + array_two[x]
  x += 1
end

print "#{array_three} \n"
