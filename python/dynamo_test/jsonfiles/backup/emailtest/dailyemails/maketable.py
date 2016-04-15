#!/usr/bin/python2.6

import urllib2
import csv
import os

def Connect2Web():
	#where to find files
	folders = ['AU1-Total-Total', 'AU1-Total-Scan','AU1-Total-Neo','AU1-Total-Client','AU1-Total-Voyager','AU1-Client-Total','AU1-Client-iOS','AU1-Client-Android','AU1-Client-DesktopWeb','NewUsers-Total','NewUsers-Scan','NewUsers-Neo','NewUsers-Voyager','ReturningUsers-Total','ReturningUsers-Scan','ReturningUsers-Neo','ReturningUsers-Voyager','Total-Downloads','iOS-Downloads','Android-Downloads','SearchEvents','LoveItEvents','LeaveItEvents','CollectionEvents','PushNotificationEvents','ActiveProfiledInterests']
	files = ['Today.txt', 'Yesterday.txt', 'Week.txt']
	
	#where to store the data
	Data = [[0 for i in range(8)] for i in range(len(folders))]
	#keep track of current data
	cur_file = -1
	cur_folder = -1

	f = open("Table.html", "w")
	
	#fill the array with the results
	for folder in folders:		#go through each folder
		cur_folder = cur_folder + 1
		Data[cur_folder][0] = folder
		print folder
		for day in files:	#open each file
			cur_file = (cur_file + 1) % 3
			with open("Output/" + folder + "/" + day) as loadfile: #for each file do the following
				for i, line in enumerate(loadfile):	#read in line by line to add to Data
					change1 = line.replace("+", "|")
					change2 = change1.replace(" ", "")
					change3 = change2.replace("-", "")
					splitRow = change3.split("|")
					if splitRow[0] != "" and splitRow[0] != "\n" and splitRow[0][0] != "(":
						if i > 0:
							Data[cur_folder][cur_file+1] = splitRow[0].replace("\n", "")


	for i in range(0, len(folders)):
		Data[i][4] = int(Data[i][1]) - int(Data[i][2])
		if int(Data[i][2]) > 0:
			Data[i][5] = round(float(float(Data[i][4])/float(Data[i][2]))*100, 2)
		Data[i][6] = int(Data[i][1]) - int(Data[i][3])
		if int(Data[i][3]) > 0:
			Data[i][7] = round(float(float(Data[i][6])/float(Data[i][3]))*100, 2)
		print >>f, "<tr>"
		for x in range(0, 8):
			print str(Data[i][x]), 
			if x == 0:
				print >>f, "<td bgcolor=\"#131395\"><font color=\"#ffffff\">" + str(Data[i][x]) + "</font></td>"
			elif x > 0 and x < 4:
				print >>f, "<td>" + str(Data[i][x]) + "</td>"
			else:
				if Data[i][x] < 0:
					print >>f, "<td><font color=\"#cc0000\">" + str(Data[i][x]) + "</font></td>"
				else:
					print >>f, "<td><font color=\"#00cc00\">" + str(Data[i][x]) + "</font></td>"
		print ""
		print >>f, "</tr>"

	f.close()

Connect2Web()
