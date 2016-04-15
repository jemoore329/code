#!/bin/bash

#sh copy_redshift.sh <start date inclusive> <end date exclusive> <file with productids>
#sh copy_redshift.sh 20150501 20150509 list

export PGHOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
export PGPORT=5439
export PGUSER=sa
export PGPASSWORD=Valaskala1000



psql analytics < get_prod.sql | tail -n +3 | sed '$d' | sed '$d' | sed 's/^ *//g'  > list



