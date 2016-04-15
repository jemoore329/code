#!/bin/bash

export PGHOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
export PGPORT=5439
export PGUSER=sa
export PGPASSWORD=Valaskala1000


#HOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
#PORT=5439


#psql -t -A -F "," -h $HOST -p $PORT analytics sa  < daily_issueid.sql > daily_out.txt

psql analytics < query.sql
