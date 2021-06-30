#!/bin/bash

USER="root"
PASSWORD="ServerAdmin"
OUTPUT="/mnt/wd/allbackups/allstruc"

cd $OUTPUT
chmod 777 *.sql

# Importing structure
mysql --user=$USER --password=$PASSWORD testdb1 < `date +%Y%m%d`.scada_rmc.sql
echo "scada_rmc inported to db1"
mysql --user=$USER --password=$PASSWORD testdb2 < `date +%Y%m%d`.gb.sql
echo "gb inported to db2"
#mysql --user=$USER --password=$PASSWORD db3 < `date +%Y%m%d`.data1.sql
#echo "data3 inported to db3"


# clearing tables
cd $OUTPUT
chmod 777 *.sql


# Importing data
mysql --user=$USER --password=$PASSWORD testdb1 < `date +%Y%m%d`.scada_rmc.sql
echo "scada_rmc inported to db1"
mysql --user=$USER --password=$PASSWORD testdb2 < `date +%Y%m%d`.gb.sql
echo "gb inported to db2"
#mysql --user=$USER --password=$PASSWORD db3 < `date +%Y%m%d`.data1.sql
#echo "data3 inported to db3"
#mysql --user=$USER --password=$PASSWORD db4 < `date +%Y%m%d`.data1.sql
#echo "data4 inported to db4"

echo "import completed"

# Verifying data
mysqldump --extended-insert=FALSE --user=$USER --password=$PASSWORD  scada_rmc > /mnt/wd/allbackups/allstruc/comp1.txt
mysqldump --extended-insert=FALSE --user=$USER --password=$PASSWORD  testdb1 > /opt/comp2.txt
cd $OUTPUT
diff comp1.txt comp2.txt