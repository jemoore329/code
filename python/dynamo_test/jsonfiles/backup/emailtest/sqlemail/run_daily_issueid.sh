#!/bin/bash

export PGHOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
export PGPORT=5439
export PGUSER=sa
export PGPASSWORD=Valaskala1000


#HOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
#PORT=5439


#psql -t -A -F "," -h $HOST -p $PORT analytics sa  < daily_issueid.sql > daily_out.txt

psql analytics < daily_issueid.sql  > daily_out.txt


(
        echo "From: jonathan@shopadvisor.com";
        echo "To: connor@shopadvisor.com";
        echo "Subject: Daily Pubs Email";
        cat mailheader.txt daily_out.txt mailfooter.txt
) | /usr/sbin/sendmail -t

mail -s "test" connor@shopadvisor.com < daily_out.txt
#mail -s "test" jonathan@shopadvisor.com < daily_out.csv
#mail -s "test" kaitlyn@shopadvisor.com < daily_out.csv



