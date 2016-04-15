#!/usr/bin/python2.6

import urllib2
import csv

def Connect2Web():
	response = open("result.txt", "r");
	wb_pg = response.read();

	f2 = open("table.html", "w");

	print >>f2, "<!DOCTYPE html>"
	print >>f2, "<html><body>"
	print >>f2, "<table cellspacing=\"5\" cellpadding=\"10\" border=\"1\">"
	
	row = wb_pg.replace("+","|")
	row = row.split("|")
	response.close()

	with open("result.txt") as loadfile:
		for i, line in enumerate(loadfile):
			change1 = line.replace("+", "|")
			change2 = change1.replace(" ", "")
			change3 = change2.replace("-", "")
			splitRow = change3.split("|")
			if splitRow[0] != "" and splitRow[0] != "\n" and splitRow[0][0] != "(":
				print >>f2, "<tr>"
				for j in range(0, len(splitRow)):
					if i == 0:
						print >>f2, "<td bgcolor=\"#66ff99\">"+splitRow[j].replace("\n", "")+"</td>"
					else:
						print >>f2, "<td>"+splitRow[j].replace("\n", "")+"</td>"
				print >>f2, "</tr>"
	print >>f2, "</table>"
	print >>f2, "</body></html>"
	f2.close()

Connect2Web()
