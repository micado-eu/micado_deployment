#!/bin/bash
echo $'\e[1;32mThis is the installer of the MICADO platform\e[0m '

do_install=y
[[ -t 0 ]] && {                   # Timeout 5 seconds (read -t 5)
read -t 15 -n 1 -p $'\e[1;32m
Have you filled the prod.env with all the needed secrets? (Y/n)\e[0m ' do_install ||  # read 'fails' on timeout
do_install=n ; }                     # Timeout => answer No
if [[ $do_install =~ ^(y|Y|)$ ]]
then
    echo -e "\033[0;34m\nI'm starting the deployment\e[0m "
    
    echo -e "\033[0;36m\nStarting PostgreSQL container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d micado_db)

    echo -e "\033[0;36m\nWaiting for PostgreSQL to start\e[0m "
    check_db="-1"
    re='^[0-9]+$'
    while [ "$check_db" = '-1' ]
    do
        check_db="1"
        # Issuing a query that should return a number, this means that the table is there and full
        db_data=$(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml exec micado_db psql -U micadoapp -t --command "select count(*) from settings" micado)
        db_data=$(echo "$db_data" | xargs)
        if [ -n "$db_data" ] && [ -z "${db_data##[0-9]*}" ]; then
            echo "Db is ready"
        else
            echo "DB is not ready: $db_data"
            check_db="-1";
            sleep 5
        fi
    done
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs micado_db)
    echo -e "\033[0;36m\nStarted PostgreSQL\e[0m "

    echo -e "\033[0;36m\nStarting MongoDB container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d mongodb)
    sleep 15
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d mongo-init-replica)

    echo -e "\033[0;36m\nStarted MongoDB\e[0m "

    echo -e "\033[0;36m\nStarting Balancer container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d balancer)
    echo -e "\033[0;36m\nStarted Balancer\e[0m "

    echo -e "\033[0;36m\nStarting Identity Server container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d identity_server)
    echo -e "\033[0;36m\nStarted Identity Server\e[0m "

    echo -e "\033[0;36m\nStarting backend container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d backend)
    echo -e "\033[0;36m\nStarted backend\e[0m "

    echo -e "\033[0;36m\nStarting API container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d api_gateway)
    echo -e "\033[0;36m\nStarted API\e[0m "

    read -n 1 -p $'\e[1;32m
    Now you have to properly configure the Identity Manager and the API manager and write correctly the env vars; when ready press (Y/n)\e[0m ' continue_install
    if [[ $continue_install =~ ^(y|Y|)$ ]]
    then
        echo "continuing the deployment"
    fi
fi

