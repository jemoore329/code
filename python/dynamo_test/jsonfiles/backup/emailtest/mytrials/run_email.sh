#!/bin/bash

export PGHOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
export PGPORT=5439
export PGUSER=sa
export PGPASSWORD=Valaskala1000


#HOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
#PORT=5439


#psql -t -A -F "," -h $HOST -p $PORT analytics sa  < daily_issueid.sql > daily_out.txt

echo "Running query"
psql analytics < query.sql > result.txt

echo "Making Table"
python maketable.py

echo "Sending email"
(
        echo "From: connor@shopadvisor.com";
        echo "To: connor@shopadvisor.com";
        echo "Subject: Testing SQL Email";
        cat mailheader.txt table.html mailfooter.txt
) | /usr/sbin/sendmail -t

#mail -s "test" connor@shopadvisor.com < result.txt
