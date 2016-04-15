#!/bin/bash

# #source_db="evoqudevdbinstance.ctorrspvka8j.us-east-1.rds.amazonaws.com"
# #db_pass="rootti123"
#source_db="toolsdb.shopadvisor.com"
#db_user="evoqu"
#db_pass="valaskala1000"

export PGHOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
export PGPORT=5439
export PGUSER=sa
export PGPASSWORD=Valaskala1000


function full_dumper {
  mysql --default-character-set=utf8 -B -u evoqu -pvalaskala1000 mysql -htoolsdb.shopadvisor.com -e "SELECT * FROM $1" | sed 's/	/|/g' |tail -n +2 > jon.pipe 
}

full_dumper "beacons.beacons"
s3cmd put jon.pipe s3://demo.evoqu.com/misc/jon.pipe

psql analytics < upload.sql

