print "Hello, World!"



#variables
x = 1
if x == 1:
    # indented four spaces
    print "x is 1"


myfloat2 = float(7)

a, b = 3, 4
print a, b

mystring = "hello"
myfloat = 10.0
myint = 20

if mystring == "hello":
    print "String: %s" % mystring

if isinstance(myfloat, float) and myfloat == 10.0:
    print "Float: %d" % myfloat

if isinstance(myint, int) and myint == 20:
    print "Integer: %d" % myint


#lists
mylist = []
mylist.append(1)
mylist.append(2)
mylist.append(3)

print(mylist[0]) 
print(mylist[1]) 
print(mylist[2]) 


numbers = [1,2,3]
strings = ["hello", "world"]
names = ["John", "Eric", "Jessica"]



second_name = names[2]


print(numbers)
print(strings)
print("the second name on the list is %s" % second_name)


number = 1 + 2 * 3 /4.0
print number

remainder = 11 % 3
print remainder


squared = 7**2
cubed = 2**3

even = [2,4,6]
odd = [1,3,5]
all_nums = even + odd
print all_nums

lotsofhellos = "hello"*3
print lotsofhellos


x = object()

x_list = [x]*10

print "x_list contains %d objects" % len(x_list)

if x_list.count(x) == 10:
    print "cool"


# strings 

name = "Jon"
age = 27
height = 6.1232
print "%s is %d years old and %.3f feet tall" % (name, age, height)

x = 5
if x == 2:
    print "x is two"
elif x == 3:
    print " x is three"
else:
    print "x is not 2 or 3"



count = 0
while count < 5:
    print count
    count += 1


numbers = [ 100, 101, 201, 202, 1, 5, 7, 10, 17, 6, 121, 122, 125]


for number in numbers:
    if number == 121:
        break
    if number %2 == 1:
        continue

    print number


def sum_two_numbers(a,b):
    return a + b


print sum_two_numbers(1,2)


