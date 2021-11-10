#!/bin/bash
echo "copying file to container"
docker cp micado.sql $(docker-compose -f docker-compose-prod.yaml ps -q micado_db):/micado.sql
echo "restoring"
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml exec micado_db pg_restore -U $POSTGRES_USER -d micado -c -v -x -O micado.sql)
echo "restored"
