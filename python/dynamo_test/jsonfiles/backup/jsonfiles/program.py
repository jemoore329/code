#!/usr/bin/python

#import needed libraries
import psycopg2
import json
import sys

selectcommands = []
stringlocations = sys.argv
stringlocations.pop(0)
res = []

print "Parsing query"
with open("query.txt") as loadfile:
        for i, line in enumerate(loadfile):
                change1 = line.replace("+", "|")
                change2 = change1.replace(" ", "")
                change3 = change2.replace("-", "")
                splitRow = change3.split("|")
                if i == 0:
			for j in range(0, len(splitRow)):
                        	selectcommands.append(str(splitRow[j]).replace("\n", ""))
		res.append(change3)

res.pop(len(res)-2)
res.pop(len(res)-1)
res.pop(1)
res.pop(0)
#begin parsing
pd = {}
for i in selectcommands:
    pd[i] = []

count = 0
for i in res:
    count = count + 1

f = open("Results.json", "w")
spot = 0
print >>f, "["
for num, line in zip(range(0, len(res)), res):
    newString = line.split("|")
    for i in range(0, len(selectcommands)):
        newString[i] = newString[i].replace("[", "")
        newString[i] = newString[i].replace("'", "")
        newString[i] = newString[i].replace("\\x", "")
        newString[i] = newString[i].replace("\n", "")
        newString[i] = newString[i].replace("\"", "")
        newString[i] = newString[i].replace("]", "")
    for i, x in zip(range(0, len(selectcommands)), selectcommands):
        pd[x].append(newString[i])
    #pd_json=json.dumps(pd,indent=4)
    #print >>f, pd_json
    print >>f, "\t{"
    for i, x in zip(range(0, len(selectcommands)), selectcommands):
        print >>f, "\t\t\"" + x + "\": ",
        if any(str(i) in s for s in stringlocations):
            print >>f, "\"" + newString[i] + "\"",
	else:
            print >>f, newString[i] + "",
        if i < len(selectcommands)-1:
            print >>f, ","
        else:
            print >>f, ""
    spot = spot+1
    if spot < count:
        print >>f, "\t},"
    else:
        print >>f, "\t}"
    #print >>f, pd_json#str(str(pd_json).replace("[", "")).replace("]","")
    for i, x in zip(range(0, len(selectcommands)), selectcommands):
        pd[x].remove(newString[i])
    #pd["type"].remove(newString[1])
    #pd["name"].remove(newString[2])
    #pd["score"].remove(newString[3])

print >>f, "]"
