#!/bin/bash

USER="root"
PASSWORD="ServerAdmin"
OUTPUT="/mnt/wd/allbackups/allstruc"

rm "$OUTPUT/*gz" > /dev/null 2>&1

databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] ; then
        echo "Dumping database: $db"
        mysqldump --force --opt --user=$USER --password=$PASSWORD -no-data --databases $db > $OUTPUT/`date +%Y%m%d`.$db.sql
        gzip $OUTPUT/`date +%Y%m%d`.$db.sql
    fi
done

mysqldump --force --opt -u root -p  scada_rmc > /mnt/wd/allbackups/fullbackups/test_rmc.sql