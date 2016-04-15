#!/bin/bash


export PGHOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
export PGPORT=5439
export PGUSER=sa
export PGPASSWORD=Valaskala1000

ruby discount.rb > jon.csv

s3cmd put jon.csv s3://demo.evoqu.com/misc/jon.csv

psql analytics < upload.sql



