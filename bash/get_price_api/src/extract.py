'''
Reads product id from a file and queries price history API to read historical data

Required startdate and enddate to be defined as YYYMMDD string to be appended to the URL
Product IDs are in the poductlist file

Outputs a space delimited flat file

API URL example
url = "https://www.shopadvisor.com/api/ph/product/e3d147b2f60f8397f73c396d809b608f68a08e21/20151101T000000Z/20151115T000000Z"

http://ph.evoqu.com:8080/product/EG00690251006496/month
http://ph.evoqu.com:8080/product/EG00690251006496/month?filter=low
http://ph.evoqu.com:8080/product/EG00690251006496/month?fmt=%25Y-%25m-%25d
http://ph.evoqu.com:8080/product/EG00690251006496/month?fmt=%25Y-%25m-%25d&filter=low
http://ph.evoqu.com:8080/product/EG00690251006496/month?fmt=%25Y-%25m-%25d&filter=mean
http://ph.evoqu.com:8080/product/EG00690251006496/month?fmt=%25Y-%25m-%25d&filter=high

'''

import urllib
import json
import datetime
import sys

'''
Query price history for a single product
Start and End Dates are strings formatted as YYYYmmdd
Date range is inclusive
'''

def query_ph(startdate, enddate, productid, trace=False):
    baseurl = "https://www.shopadvisor.com/api/ph/product/"
    url = baseurl + productid + "/" + startdate + "T000000Z" + "/" + enddate + "T000000Z" + "?filter=mean"
    # url = baseurl + productid + "/month?filter=mean"
    # if trace: 
    # print url
    results = dict()
    try:
        response = urllib.urlopen(url);
        data = json.loads(response.read())
        if trace: print data
        results[productid] = get_empty_set(startdate, enddate)
        for v in data:
            date = datetime.datetime.utcfromtimestamp(int(v[0])).strftime('%Y-%m-%d')
            if results[productid].has_key(date):
                 results[productid][date] = v[1]
    except ValueError as e:
        if trace: print "No data",
        results[productid] = "No data"
    #print results
    return results

'''
Produce a data set with zero values for each date
'''
def get_empty_set(startdate, enddate):
    start_date = datetime.datetime.strptime(startdate, "%Y%m%d").date()
    end_date = datetime.datetime.strptime(enddate, "%Y%m%d").date()
    delta = datetime.timedelta(days=1)
    empty = {}

    d = start_date
    while d < end_date:
        empty[d.strftime("%Y-%m-%d")] = 0
        d += delta
    return empty

def print_normalized_set(startdate, enddate, result):
    start_date = datetime.datetime.strptime(startdate, "%Y%m%d").date()
    end_date = datetime.datetime.strptime(enddate, "%Y%m%d").date()
    delta = datetime.timedelta(days=1)
    for k,v in result.iteritems():
        print k,
        try:
            d = start_date
            while d < end_date:
                print d.strftime("%Y-%m-%d"), v[d.strftime("%Y-%m-%d")],
                d += delta
            print
        except TypeError:
            print "no data"
        
def print_comma_separated_set(startdate, enddate, result):
    start_date = datetime.datetime.strptime(startdate, "%Y%m%d").date()
    end_date = datetime.datetime.strptime(enddate, "%Y%m%d").date()
    delta = datetime.timedelta(days=1)
    for k,v in result.iteritems():
        print k,
        try:
            d = start_date
            while d < end_date:
                # print d.strftime("%Y-%m-%d"), v[d.strftime("%Y-%m-%d")],
                print "," , v[d.strftime("%Y-%m-%d")],
                d += delta
            print
        except TypeError:
            print "no data"


def print_comma_separated_set_2(startdate, enddate, result):
    start_date = datetime.datetime.strptime(startdate, "%Y%m%d").date()
    end_date = datetime.datetime.strptime(enddate, "%Y%m%d").date()
    delta = datetime.timedelta(days=1)
    for k,v in result.iteritems():
        
        try:
            d = start_date
            while d < end_date:
                # print d.strftime("%Y-%m-%d"), v[d.strftime("%Y-%m-%d")],
                print "("+"'"+k+"'", ",", "'"+d.strftime("%Y-%m-%d")+"'", 
                print "," , v[d.strftime("%Y-%m-%d")],")",",",
                d += delta
                print
        except TypeError:
            print "nothing"

        
def print_header_string(startdate, enddate):
    #start_date = datetime.datetime.strptime(startdate, "%Y%m%d").date()
    #end_date = datetime.datetime.strptime(enddate, "%Y%m%d").date()
    #print "Product ID, Date, Price",
    #d = start_date
    #delta = datetime.timedelta(days=1)
    #while d < end_date:
    #    print ",", d.strftime("%Y-%m-%d"), 
    #    d += delta
    print
#
# Program entry point
#
if len(sys.argv) != 4:
    print
    print "Usage:"
    print "     " + sys.argv[0] + " startdate enddate idlist"
    print
    raise SystemExit

startdate = sys.argv[1]
enddate = sys.argv[2]
infile = sys.argv[3]


# Print CSV Header
print_header_string(startdate, enddate)

# Read input data
with open(infile) as f:
    content = f.readlines()
# produce target url and query the api
for i in content:
    # print_normalized_set(startdate, enddate, query_ph(startdate,enddate,i.strip()))
    print_comma_separated_set_2(startdate, enddate, query_ph(startdate,enddate,i.strip()))




