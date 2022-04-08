#!/bin/bash
source prod.env
source .env

echo "Creating DB backup"
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml exec micado_db pg_dump -d $POSTGRES_DB -n $MICADO_DB_SCHEMA -U $POSTGRES_USER -c -b -x -O --no-tablespaces --inserts -f micado.sql)
docker cp $(docker-compose -f docker-compose-prod.yaml ps -q micado_db):/micado.sql micado.sql


echo "Creating GIT-backend backup"
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose.yml exec backend tar -zcv -f /home/node/translations.tar.gz /tmp/translations/)
docker cp  micado_deployment_backend_1:/home/node/translations.tar.gz translations.tar.gz


echo "unzipping the 1.1.8 release"


echo "restoring old translation files in backend"
mkdir -p translations_dir
tar -xf  translations.tar.gz --strip-components=2 -C ./translations_dir

echo "removing frontend old containers"

echo "yes" | (set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml rm data_pa)
echo "yes" | (set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml rm data_ngo)
echo "yes" | (set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml rm data_migrants)

echo "cleaning docker old images"
echo "yes" | docker image prune
echo "cleaning docker old containers"
echo "yes" | docker container prune

echo "getting updated images of frontent and backend"
docker pull micadoproject/ngo_app_site:latest
docker pull micadoproject/pa_app_site:latest
docker pull micadoproject/backend:latest
docker pull micadoproject/migrant_app_site:latest



echo "recreating frontend, backend, nginx, rasa, action_server"
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate data_pa)
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate backend)
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate data_ngo)
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate data_migrants)
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate nginx)
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate chatbot_en)
(set -a; source prod.env; source .env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate action_server)


echo "altering DB"
docker exec -i micado_deployment_micado_db_1 psql -U $MICADO_DB_USER -W $MICADO_DB_PWD -d $POSTGRES_DB < DB_ALTER_1.2.0.sql
# cat ./query.sql | docker exec -i <container-name> psql -U <user> -d <database>
