#!/bin/bash
#hostname=`hostname`

DATE=`date +"%Y%m%d_%H%M"`

## Backup database
#pg_dump -U postgres -d CTrendsERP_2017 | gzip > /data/dbbackup/`date +"%Y%m%d_%H%M".gz`
# pg_dump -U postgres -h 127.0.0.1 -p 5432 -d ctrendsebs_db > /data/dbbackup/ctrendsebs_db`date +"%Y%m%d_%H%M".dump` #don't work
#pg_dump -p 5432 -C -h 127.0.0.1 -U CTrends_conn -d CTrendsERP_2017 > tar -cf /data/dbbackup/CTrendsEBS_DB`date +"%Y%m%d_%H%M".tar` #don't work

pg_dump -h 127.0.0.1 -U postgres -F t CTrendsERP_2017 --role=ctrends_conn > /data/dbbackup/ctrendsebs_db$DATE.tar
echo "'CTrendsERP_2017' Database backup successfull."
## Create Database
psql -U postgres -h 127.0.0.1 -p 5432 -c "CREATE DATABASE ctrendsebs_2018 WITH OWNER ctrends_conn;"
echo "'ctrendsebs_2018' Database created."

## Drop Database
#psql -U postgres -h 127.0.0.1 -p 5432 -c "DROP DATABASE ctrendsebs_2018;"
#psql -U postgres -h 127.0.0.1 -p 5432 -c "DROP DATABASE ctrendsebs --force;"

## Restore Database:
# psql -h 127.0.0.1 -p 5432 -U postgres -d ctrendsebs_2018 < /data/dbbackup/CTrendsEBS_DB20180225_1838.tar
## or
pg_restore -h 127.0.0.1 -p 5432 -U postgres -w -F t -d ctrendsebs_2018 /data/dbbackup/ctrendsebs_db$DATE.tar
echo "'ctrendsebs_2018' Database restore successfull."

exit 0
