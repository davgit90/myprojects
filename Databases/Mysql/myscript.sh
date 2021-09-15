#!/bin/bash

USER="root"
PASSWORD="ServerAdmin"
OUTPUT="/mnt/wd/allbackups/allstruc"

#rm "$OUTPUT/*gz" > /dev/null 2>&1

for db in $databases; do
    if [[ "$db" != "information_schema" ]] ; then
        echo "Dumping database: $db"
        mysqldump --force --opt --user=$USER --password=$PASSWORD  --no-data --databases $db > $OUTPUT/`date +%Y%m%d`.$db.sql
    fi
#done

mysql --user=$USER --password=$PASSWORD -e "CREATE DATABASE testdb1; CREATE DATABASE testdb2;"
cd $OUTPUT
chmod 777 *.sql
mysql --user=$USER --password=$PASSWORD testdb1 < `date +%Y%m%d`.scada_rmc.sql
echo "scada_rmc inported to db1"
mysql --user=$USER --password=$PASSWORD testdb2 < `date +%Y%m%d`.gb.sql
echo "gb inported to db2"
#mysql --user=$USER --password=$PASSWORD db3 < `date +%Y%m%d`.data1.sql
#echo "data3 inported to db3"
#mysql --user=$USER --password=$PASSWORD db4 < `date +%Y%m%d`.data1.sql
#echo "data4 inported to db4"

echo "import completed"

mysqldump --extended-insert=FALSE --user=$USER --password=$PASSWORD  scada_rmc > /mnt/wd/allbackups/allstruc/comp1.txt
mysqldump --extended-insert=FALSE --user=$USER --password=$PASSWORD  testdb1 > /opt/comp2.txt
cd $OUTPUT
diff comp1.txt comp2.txt


| Temp_Akepadu       |
| gb                 |
| hmwssb             |
| mysql              |
| performance_schema |
| scada_akepadu      |
| scada_hmwssb       |
| scada_mmc          |
| scada_rmc          |
| scada_ro           |
| scada_temp_new     |
| test_database      |
| vts_ptrack         |
| vts_tbox

mysql -u root -p gb > /mnt/wd/allbackups/dumpfilename1.sql > /mnt/wd/allbackups/mysqldump.log 2>&1


mysql --user='root' --password='Root@#123' -e "CREATE DATABASE `+%Y%m%d`";
mysql -uroot -e "create database mysql.`date +%Y%m%d`;"
mysql -u root -p -Nse 'show tables' data1 | while read table; do mysql -e "truncate table $table" data1; done

