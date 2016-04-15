
a= range(1,10)
b = [1]*9

c = map(lambda (a,b) : a+b, zip(a,b))
print c

