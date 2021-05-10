#!/bin/bash
echo "generating dump backup"
# docker-compose may not be found sometimes when in cron, so in first arg you can pass the absolute path to docker-compose (without the final docker-compose)
# the script can be run without arguments if docker-compose is in PATH
# example of crontab
# @daily /MICADO/backup.sh /usr/local/bin/
(set -a; source prod.env; source .env; set +a; $1docker-compose -f docker-compose-prod.yaml exec micado_db pg_dump -d $POSTGRES_DB -n $MICADO_DB_SCHEMA -U $POSTGRES_USER -Fc -c -v -b -x -O -f micado.sql)
echo "dump generated, saving file"
docker cp $($1docker-compose -f docker-compose-prod.yaml ps -q micado_db):/micado.sql micado.sql
echo "file saved at micado.sql"
