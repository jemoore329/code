import json

res = []

print("Parsing query")
with open("query.txt") as loadfile:
        for i, line in enumerate(loadfile):
                change1 = line.replace("  +  ", "  |  ")
                change2 = change1.replace(" ", "")
                change3 = change2.replace("-", "")
		res.append(change3)

res.pop(len(res)-2)
res.pop(len(res)-1)
res.pop(1)
res.pop(0)

#begin parsing
pd = {}
pd["shopper_id"] = []
pd["affinity"] = {}

f = open("Results.json", "r+")

currentuser = "NULL"
jsonstring = ""
for num, line in zip(range(0, len(res)), res):
    newString = line.split("|")
    for i in range(0, len(newString)):
        newString[i] = newString[i].replace("'", "")
        newString[i] = newString[i].replace("\n", "")
        newString[i] = newString[i].replace("\"", "")
	newString[i] = newString[i].replace("+", "")
    #begin array
    if currentuser != newString[0]:
	if currentuser != "NULL":
	    pd["shopper_id"] = currentuser
	    print("Brandnames: " + str(len(pd["affinity"])))
	    print >>f, json.dumps(pd)
	print("New User:" + newString[0])
	currentuser = newString[0]
	del pd["affinity"]
	pd["affinity"] = {}
	pd["affinity"][newString[1]] = newString[2]
    else:
	print(newString[0])
	pd["affinity"][newString[1]] = newString[2]
