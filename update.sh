#!/bin/bash

echo "yes" | (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml rm data_pa)
echo "yes" | (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml rm data_ngo)
echo "yes" | (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml rm data_migrants)
docker pull micadoproject/ngo_app_site:latest
docker pull micadoproject/pa_app_site:latest
docker pull micadoproject/backend:latest
docker pull micadoproject/migrant_app_site:latest
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate data_pa)
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate backend)
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate data_ngo)
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d --force-recreate data_migrants)
