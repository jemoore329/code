jon = 1

if jon == 1:
   print "yes"
if jon < 1:
   print "no"


title = "People StyleWatch March 2015 Summary"
print title.split(" ",2)
print title.split(" ",2)[0]
print title.split(" ",2)[1]





'''    
    def get_top_pages(self, channels):
        pd = {}
        pd["header"] = "Top 5 Pages by Title"
        pd["titles"] = [
                          ["number","Folio"],
                          ["string","Pagetitle"],
                          ["number","Opens"]
                        ]
        pd["formatter"] = [0,1,1]
        pd["aggregator"] = None
        pd["data"] = []

        sql = """
           
              ;"""

        idlist = []
        for k,v in channels.iteritems():
            idlist.extend(v)

        # print idlist

        query = sql.format(idlist = ",".join(map(str,idlist)), chan = k)
        res = self.rs.query_database(query)
        # print res
        for i in res:
            pd["data"].append(list(i))

        return pd

'''
