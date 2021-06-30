#!/bin/bash

USER="root"
PASSWORD="ServerAdmin"
OUTPUT="/mnt/wd/allbackups/alldata"

rm "$OUTPUT/*gz" > /dev/null 2>&1

databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] ; then
        echo "Dumping database: $db"
        mysqldump --force --opt --user=$USER --password=$PASSWORD --databases --no-create-info $db > $OUTPUT/`date +%Y%m%d`.$db.sql
    fi
done