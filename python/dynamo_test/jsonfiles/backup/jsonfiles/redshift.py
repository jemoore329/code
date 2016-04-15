#!/usr/bin/python

#import needed libraries
import psycopg2
import json
import sys

#attempt to connect to db
try:
    conn = psycopg2.connect(host = 'analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com',
    #conn=psycopg2.connect(host = 'localhost',
                      port = 5439,
                      database = 'analytics',
                      user = 'sa',
                      password = 'Valaskala1000')
except:
       print "I am unable to connect to the database."

#define the query from the sql variable below
def query_database(sql):
    try:
        cur = conn.cursor()
        cur.execute(sql)
        return cur.fetchall()
    except psycopg2.Error as e:
        print "I can't SELECT from bar"
        print e 

#strings for select
#selectcommands = ["id", "email"]
#stringlocations = ["1"]
selectcommands = ["shopper_id", "type", "name", "score"]
stringlocations = ["1", "2"]

sql = """select shopper_id, type, replace(name, ',','') as name, score
from signals.user_score 
where shopper_id = 1445244
--and name like 'LANC%'
;"""
#the query that will be ran
#sql = """select id, email1 as email
#from replica.evoquproddb_users
#where email1 like '%shopadvisor%'
#group by 1,2
#;
#"""

#get the results
pd = {}
print len(selectcommands)
for i in selectcommands:
    pd[i] = []
res = query_database(sql)
print res

f = open("Results.json", "w")

#make a list of the results and append each row into it
print >>f, "["
count = 0
for i in res:
 count = count+1

spot = 0
for i in res:
    newString = str(list(i)).split(",")
    for i, x in zip(range(0, len(selectcommands)), selectcommands):
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

#pd_json=json.dumps(pd)

#put the results into a json file
#print >>f2, pd_json







