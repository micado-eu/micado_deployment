#!/bin/bash

if [ $# -ne 1]
  then
    echo -e "wrong number of arguments"
    exit 1
fi

rm -rf mupdate

wget https://github.com/micado-eu/micado_deployment/releases/download/1.1.4/micado_deployment_$1.tar.gz

mkdir mupdate
mv micado_deployment_$1.tar.gz mupdate/micado_deployment_$1.tar.gz
cd mupdate/
ls
tar -xvzf micado_deployment_$1.tar.gz 


/bin/cp mupdate/docker-compose-prod.yaml micado_deployment/docker-compose-prod.yaml 
/bin/cp mupdate/traefik/traefik.toml micado_deployment/traefik/traefik.toml 
/bin/cp mupdate/traefik/dynamic.toml micado_deployment/traefik/dynamic.toml 
/bin/cp mupdate/install_micado.sh micado_deployment/install_micado.sh 
