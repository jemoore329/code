#!/bin/bash
#

#echo "Start date YYYYmmddi (inclusive)"
#read startdate
#echo "End date as YYYYmmdd (exclusive)"
#read enddate
#echo "Enter filename with product ids"
#read filename

#python src/extract.py $startdate $enddate $filename > jon.csv
python src/extract.py $1 $2 $3 > jon.csv

# python src/extract.py 20131101 20140115 idlist.full | sed 's/20[0-9][0-9]-[0-9][0-9]-[0-9][0-9]//g' 
