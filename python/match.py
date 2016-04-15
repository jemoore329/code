import csv
with open('test1.csv', 'rb') as csvfile:
  outfile = csv.reader(csvfile)
  for a,b,c in outfile:
    print a,b,c




