#!/usr/bin/ruby
require "matrix"


#comment

=begin
#more comments
=end

puts "hello world"

def sum(a,b)
   a + b
end

x=1
y=2.423223
puts "x is equal to  %s." % x
puts "y is equal to %s" %y
puts "this is the sum of x and y %s" %sum(x,y)

a = Vector[1,4,3,4]
b= Vector[2,3,4, 2]
c= a + b
#print "vector c is %s, %s, %s \n" %[c[0], c[1], c[2]]
puts c

size = a.size

1.upto(size) do |a|
print a, " "
end

print "\n"


#for i in 0..size
#end

i = 0
a.each do |x|
  #t = "" + x.to_s
  #puts "#{t.to_i + b[i]}"
  puts "#{a[i] + b[i] }"
  i +=1
end


multi_array = [[1,2,3], [4,5,6]]
multi_array.each do |x|
puts "#{x}\n"
end

def add(a,b)
    return a+b
end

c = add(1,2)
puts c

def alphabetize(arr, rev=false)
   arr.sort!
   if rev == true
       arr.reverse!
   end
   return arr
end

numbers = [1,5,3,2,4]

alphabetize(numbers)
puts numbers


my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

my_array.each do |x|
    puts x if x % 2 == 0 
end

 
