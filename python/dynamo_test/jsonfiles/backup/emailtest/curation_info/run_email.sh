#!/bin/bash

export PGHOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
export PGPORT=5439
export PGUSER=sa
export PGPASSWORD=Valaskala1000


#HOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
#PORT=5439


#psql -t -A -F "," -h $HOST -p $PORT analytics sa  < daily_issueid.sql > daily_out.txt

pushd /home/ec2-user/connor/emailtest/curation_info


echo "Running query"
psql analytics < query.sql > result.txt

echo "Making Table"
python maketable.py

echo "Sending email"
(
        echo "From: connor@shopadvisor.com";
        echo "To: connor@shopadvisor.com, jonathan@shopadvisor.com";
        echo "Subject: ---- ACTIVE MAGAZINE ISSUES ----";
        cat mailheader.txt table.html mailfooter.txt
) | /usr/sbin/sendmail -t

echo "Running query 2"
psql analytics < query2.sql > result.txt

echo "Making Table 2"
python maketable.py

echo "Sending email 2"
(
        echo "From: connor@shopadvisor.com";
        echo "To:  connor@shopadvisor.com, jonathan@shopadvisor.com";
        echo "Subject: ---- UNLABELED ISSUES WITH ACTIVITY ----";
        cat mailheader.txt table.html mailfooter.txt
) | /usr/sbin/sendmail -t

echo "Removing temporary files"

rm result.txt table.html

popd


