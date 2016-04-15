from __future__ import print_function # Python 2/3 compatibility
import boto3
import json
import decimal
import os

dynamodb = boto3.resource('dynamodb', region_name='us-west-2', endpoint_url="http://localhost:8000")

table = dynamodb.Table('Affinity')

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
	    fname = currentuser + ".json"
	    f = open(fname, "w")
	    print(json.dumps([pd],indent=4),file=f)
	    print(json.dumps([pd],indent=4))
	    f.close()
	    with open(fname) as json_file:
                shoppers = json.load(json_file, parse_float = decimal.Decimal)
                for shopper in shoppers:
                    shopper_id = int(shopper['shopper_id'])
                    affinity = shopper['affinity']

                    print("Adding shopper:", shopper_id)

                    table.put_item(
                       Item={
                           'shopper_id': shopper_id,
                           'affinity': affinity,
                        }
                    )
	    os.remove(fname)
	print("New User:" + newString[0])
	currentuser = newString[0]
	del pd["affinity"]
	pd["affinity"] = {}
	pd["affinity"][newString[1]] = newString[2]
    else:
	pd["affinity"][newString[1]] = newString[2]
pd["shopper_id"] = currentuser
print("Brandnames: " + str(len(pd["affinity"])))
fname = currentuser + ".json"
f = open(fname, "w")
print(json.dumps([pd],indent=4),file=f)
f.close()
with open(fname) as json_file:
    shoppers = json.load(json_file, parse_float = decimal.Decimal)
    for shopper in shoppers:
        shopper_id = int(shopper['shopper_id'])
        affinity = shopper['affinity']
        print("Adding shopper:", shopper_id)
        table.put_item(
           Item={
               'shopper_id': shopper_id,
               'affinity': affinity,
           }
        )
os.remove(fname)
