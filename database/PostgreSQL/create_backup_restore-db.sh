#!/bin/bash

## Backup Database
# pg_dump -h 127.0.0.1 -U postgres -F t ctrendsebs_db --role=ctrends_conn > /data/dbbackup/ctrendsebs_db`date +"%Y%m%d_%H%M".tar`

## Create Database
# psql -U postgres -h 127.0.0.1 -p 5432 -c "CREATE DATABASE ctrendsebs_2018 WITH OWNER ctrends_conn;"

## Restore Database:
# pg_restore -h 127.0.0.1 -p 5432 -U postgres -w -F t -d ctrendsebs_2018 /data/dbbackup/ctrendsebs_db20180225_2322.tar

## Run SQL Queries
psql -h 127.0.01 -p 5432 -U postgres -d ctrendsebs_2018 -w -a -q  F -f /data/dbscript/sqlquery.sql
psql "dbname='ctrendsdb' user='postgres' password='123456' host='127.0.0.1' port='5432'" -f /data/dbscript/sqlquery.sql

