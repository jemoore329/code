#!/bin/bash

#sh copy_redshift.sh <start date inclusive> <end date exclusive> <file with productids>
#sh copy_redshift.sh 20150501 20150509 list

export PGHOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
export PGPORT=5439
export PGUSER=sa
export PGPASSWORD=Valaskala1000


python src/extract.py $1 $2 $3 > jon.csv

rm -f insert.sql
sed -ie '/nothing/d' jon.csv
sed -ie '$s/,$//' jon.csv

echo "insert into insight.price_history values" >> insert.sql
cat jon.csv >> insert.sql
echo ";" >> insert.sql

psql analytics < drop_create.sql
psql analytics < insert.sql
