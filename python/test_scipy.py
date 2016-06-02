import numpy as np
from scipy import linalg

a = np.array([1,4,5,8], int)
b = np.array(range(10), int)

c = np.array([[1,2],[3,4]])
print "this is vector a:"
print a
print '\n'

print "this is vector b:"
print b
print '\n'

print "this is matrix c:"
print c
print '\n'

print "this is the determinant of c: %d" % linalg.det(c)
#print linalg.det(c)
