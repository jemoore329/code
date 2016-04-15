#!/usr/bin/python
import psycopg2
import json

try:
    conn = psycopg2.connect(host = 'analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com',
    #conn=psycopg2.connect(host = 'localhost',
                      port = 5439,
                      database = 'analytics',
                      user = 'sa',
                      password = 'Valaskala1000')
except:
       print "I am unable to connect to the database."
        
def query_database(sql):
    try:
        cur = conn.cursor()
        cur.execute(sql)
        return cur.fetchall()
    except psycopg2.Error as e:
        print "I can't SELECT from bar"
        print e 



sql = """select id, email1
from replica.evoquproddb_users
where email1 like '%shopadvisor.com'
group by 1,2
;"""
pd = {}
pd["data"] = []
res = query_database(sql)

for i in res:
    pd["data"].append(list(i))

print pd
print "\n-------------------------------------------\n"
pd_json=json.dumps(pd,indent=4)
#pd_json=json.dumps(pd)
print pd_json


