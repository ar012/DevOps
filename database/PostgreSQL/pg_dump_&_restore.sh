# Create database with role:
#==========================
#CREATE DATABASE ctrendsebs_db0301
#  WITH ENCODING='UTF8'
#       OWNER=ctrends_conn
#       CONNECTION LIMIT=-1;

# For DB custom backup:
#======================
/usr/bin/pg_dump --host 192.168.100.201 --port 5433 --username "postgres" --role "CTrends_conn" --no-password  --format custom --blobs --verbose --file "/home/abdurrazzak/Documents/ctrendsebs_db20180301.backup" "CTrendsEBS"

# For DB tar backup:
#===================
/usr/bin/pg_dump --host 192.168.100.201 --port 5433 --username "postgres" --role "CTrends_conn" --no-password  --format tar --blobs --verbose --file "/home/abdurrazzak/Documents/ctrendsebs_db0301.tar" "CTrendsEBS"

# For DB backup without role:
#===========================
/usr/bin/pg_dump --host 192.168.100.201 --port 5433 --username "postgres" --no-password  --format custom --blobs --verbose --file "/home/abdurrazzak/Documents/ctrendsebs_db0301(2).backup" "CTrendsEBS"

# For DB restore from .backup file:
#==================================
/usr/bin/pg_restore --host 127.0.0.1 --port 5432 --username "postgres" --dbname "ctrendsebs_db20180301" --role "ctrends_conn" --no-password  --verbose "/home/abdurrazzak/Documents/ctrendsebs_db20180301.backup"

# For DB restore from .tar file:
#==============================
/usr/bin/pg_restore --host 127.0.0.1 --port 5432 --username "postgres" --dbname "ctrendsebs_db0301" --role "ctrends_conn" --no-password  --verbose "/home/abdurrazzak/Documents/ctrendsebs_db20180301.tar"



/usr/bin/pg_restore --host 127.0.0.1 --port 5432 --username "postgres" --dbname "ctrendsebs_dbtest" --role "ctrends_conn" --no-password  --verbose "smb://192.168.100.201/ctrendsebs_db/ctrendsebs_db20180301.tar"

