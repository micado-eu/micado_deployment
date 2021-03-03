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

    echo -e "\033[0;34m\nCreating folders\e[0m "
    mkdir -p db_data weblate_data redis_data identity-server_data/deployment identity-server_data/tenants shared_images
    chmod 777 shared_images
    touch traefik/traefik-acme/acme.json
    chmod 600 traefik/traefik-acme/acme.json

    echo "\nSetting environment"
    set -a; source prod.env; set +a;
    set -a; source .env; set +a;

    echo -e "\033[0;34m\nPreparing certificates for the Identity Server\e[0m "
    cp templates/*.jks deployment/
    keytool -genkey -alias micado -keyalg RSA -keysize 2048 -keystore deployment/wso2carbon.jks -storepass wso2carbon -keypass wso2carbon -keyalg RSA -validity 3650 -dname "CN=$IDENTITY_HOSTNAME, OU=micado, O=Micado, L=TO, ST=TO, C=EU"
    keytool -list -v -storepass wso2carbon -keystore deployment/wso2carbon.jks|grep "micado"
    keytool -export -alias micado -storepass wso2carbon -keystore deployment/wso2carbon.jks -file deployment/micado.pem
    keytool -import -alias micado -storepass wso2carbon -file deployment/micado.pem -keystore deployment/client-truststore.jks -noprompt
    sed -ir "s/^[#]*\s*WSO2_IDENTITY_KEYSTORE_PWD=.*/WSO2_IDENTITY_KEYSTORE_PWD=wso2carbon/" prod.env
    sed -ir "s/^[#]*\s*WSO2_IDENTITY_TRUSTSTORE_PWD=.*/WSO2_IDENTITY_TRUSTSTORE_PWD=wso2carbon/" prod.env
    sed -ir "s/^[#]*\s*WSO2_IDENTITY_CERTIFICATE_PWD=.*/WSO2_IDENTITY_CERTIFICATE_PWD=wso2carbon/" prod.env
    sed -ir "s/^[#]*\s*WSO2_IDENTITY_CERTIFICATE_ALIAS=.*/WSO2_IDENTITY_CERTIFICATE_ALIAS=micado/" prod.env
    set -a; source prod.env; set +a;

    cp deployment/*.jks identity-server/repository/resources/security/

    echo -e "\033[0;34m\nPreparing service provider files\e[0m "
    export NEW_MIGRANT_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    export NEW_PA_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    export NEW_NGO_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    envsubst < templates/migrants_sp.xml.templates > deployment/migrants_sp.xml
    envsubst < templates/pa_sp.xml.templates > deployment/pa_sp.xml
    envsubst < templates/ngo_sp.xml.templates > deployment/ngo_sp.xml
    # Now we copy the UUID to the prod.env
    sed -ir "s/^[#]*\s*IDENTITY_SP_MIGRANTS_CLIENT_ID=.*/IDENTITY_SP_MIGRANTS_CLIENT_ID=$NEW_MIGRANT_UUID/" prod.env
    sed -ir "s/^[#]*\s*IDENTITY_SP_PA_CLIENT_ID=.*/IDENTITY_SP_PA_CLIENT_ID=$NEW_PA_UUID/" prod.env
    sed -ir "s/^[#]*\s*IDENTITY_SP_NGO_CLIENT_ID=.*/IDENTITY_SP_NGO_CLIENT_ID=$NEW_NGO_UUID/" prod.env
    set -a; source prod.env; set +a;


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

    sleep 25

    # BALANCER
    echo -e "\033[0;36m\nStarting Balancer container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d balancer)
    echo -e "\033[0;36m\nStarted Balancer\e[0m "

    sleep 15

    # IDENTITY SERVER
    echo -e "\033[0;36m\nStarting Identity Server container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d identity_server)
    sleep 25
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs identity_server)
    echo -e "\033[0;36m\nStarted Identity Server\e[0m "

# Configure IDENTITY SERVER
#curl --write-out "%{http_code}\n" -X POST https://identity.micadoproject.eu/services/RemoteAuthorizationManagerService.RemoteAuthorizationManagerServiceHttpsSoap11Endpoint/   -H 'Content-Type: text/xml'   -H 'Authorization: Basic YWRtaW5AcGEubWljYWRvLmV1Om1pY2Fkb2FkbTIwMjA='   -H 'SOAPAction: urn:authorizeRole'   -d '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.ws.um.carbon.wso2.org"><soapenv:Header/><soapenv:Body><ser:authorizeRole><ser:roleName>Application/pa_sp</ser:roleName><ser:resourceId>/permission/admin/login</ser:resourceId><ser:action>ui.execute</ser:action></ser:authorizeRole></soapenv:Body></soapenv:Envelope>'

    # WEBLATE
    echo -e "\033[0;36m\nStarting WEBLATE containers deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d cache)
    sleep 15
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d git)
    sleep 15
    echo -e "\033[0;36m\nAdding SCHEMA to git_data/gitea/conf/app.ini, if it's not working try running running the command as root\e[0m "
    sed  -i "/DB_TYPE/a SCHEMA=$GITEA_DB_SCHEMA" git_data/gitea/conf/app.ini

    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d weblate)
    sleep 25
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs weblate)
    echo -e "\033[0;36m\nStarted WEBLATE\e[0m "

    while true; do
        read -p "Weblate is started now you need to configure GIT before installation can continue, press y after you configured " ready
        case $ready in
            [Yy]* ) break;;
            * ) echo "Please answer yes (Y or y).";;
        esac
    done

    # BACKEND
    echo -e "\033[0;36m\nStarting backend container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d backend)
    sleep 15
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs backend)
    echo -e "\033[0;36m\nStarted backend\e[0m "

    # API GATEWAY
    echo -e "\033[0;36m\nStarting API container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d api_gateway)
    sleep 25
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs api_gateway)
    echo -e "\033[0;36m\nStarted API\e[0m "

    # COUNTLY
    echo -e "\033[0;36m\nStarting Countly containers deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d countly_api)
    sleep 25
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d countly_frontend)
    sleep 25
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs countly_frontend)
    echo -e "\033[0;36m\nStarted Countly\e[0m "

    # NGINX
    echo -e "\033[0;36m\nStarting NGINX container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d nginx)
    sleep 5
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs nginx)
    echo -e "\033[0;36m\nStarted NGINX\e[0m "

    # RASA/CHATBOT
    echo -e "\033[0;36m\nStarting Chatbot containers deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d action_server)
    sleep 15
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d duckling_server)
    sleep 15
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d chatbot)
    sleep 25
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs chatbot)
    echo -e "\033[0;36m\nStarted Chatbot\e[0m "

    # ROCKETCHAT
    echo -e "\033[0;36m\nStarting Rocketchat container deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d rocketchat)
    sleep 55
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs rocketchat)
    echo -e "\033[0;36m\nStarted ROCKETCHAT\e[0m "

    # probably better to ask if the rocketshat is active before going on otherwise we risk that RC is not ready

    # Configure RocketChat
    ## Auth
    bot_name=rasa_bot
    rktauth=`curl -X POST https://$ROCKETCHAT_HOSTNAME/api/v1/login -H 'Content-Type: application/json' -d "{\"username\": \"$ROCKETCHAT_ADMIN\", \"password\": \"$ROCKETCHAT_ADMIN_PWD\"}"`
    echo "$rktauth"| jq '.'
    rktuid=`echo "$rktauth"| jq -r '.data.userId'`
    rkttk=`echo "$rktauth"| jq -r '.data.authToken'`
    echo "\n"
    echo "$rktuid"
    echo "\n"
    echo "$rkttk"
    ## 
    echo "create user"
    rktres=`curl -X POST https://$ROCKETCHAT_HOSTNAME/api/v1/users.create -H 'Content-Type: application/json' -H "X-Auth-Token: $rkttk" -H "X-User-Id: $rktuid" -d "{\"name\": \"rasa_bot\",\"email\": \"luca.gioppo@csi.it\",\"password\": \"micadobot\",\"username\": \"rasa_bot\",\"requirePasswordChange\": false,\"sendWelcomeEmail\": false, \"roles\": [\"bot\"]}"`
    echo "$rktres"
    echo "$rktres" | jq '.'
    ##CREATE LIVE CHAT AGENT
    rktres=`curl -X POST https://$ROCKETCHAT_HOSTNAME/api/v1/livechat/users/agent -H 'Content-Type: application/json' -H "X-Auth-Token: $rkttk" -H "X-User-Id: $rktuid" -d "{\"username\": \"$bot_name\"}"`
    echo "$rktres"
    agent_user_id=`echo "$rktres"| jq -r '.user._id'`
    echo "$agent_user_id"

    sha256password=$(echo -n "$ROCKETCHAT_ADMIN_PWD" | sha256sum | awk '{print $1}')
    echo $sha256password
    ##CONFIGURE LIVECHAT and SETTINGS
    rktres=`curl -X POST https://$ROCKETCHAT_HOSTNAME/api/v1/settings/Livechat_enabled -H "x-2fa-method:password" -H "x-2fa-code: $sha256password" -H 'Content-Type: application/json' -H "X-Auth-Token: $rkttk" -H "X-User-Id: $rktuid" -d "{\"value\": true}"`
    echo "$rktres"
    echo "$rktres" | jq '.'
    rktres=`curl -X POST https://$ROCKETCHAT_HOSTNAME/api/v1/settings/Livechat_registration_form -H "x-2fa-method:password" -H "x-2fa-code: $sha256password" -H 'Content-Type: application/json' -H "X-Auth-Token: $rkttk" -H "X-User-Id: $rktuid" -d "{\"value\": false}"`
    echo "$rktres" | jq '.'
    rktres=`curl -X POST https://$ROCKETCHAT_HOSTNAME/api/v1/settings/Livechat_title -H "x-2fa-method:password" -H "x-2fa-code: $sha256password" -H 'Content-Type: application/json' -H "X-Auth-Token: $rkttk" -H "X-User-Id: $rktuid" -d "{\"value\": \"Micado bot\"}"`
    echo "$rktres" | jq '.'
    ##CREATE DEPARTMENT
    rktres=`curl -X POST https://$ROCKETCHAT_HOSTNAME/api/v1/livechat/department -H 'Content-Type: application/json' -H "X-Auth-Token: $rkttk" -H "X-User-Id: $rktuid" -d "{\"department\":{\"enabled\": true,\"showOnRegistration\": true,\"showOnOfflineForm\":false,\"email\": \"email@email.com\",\"name\": \"micado\",\"description\": \"default department\"},\"agents\": [{\"agentId\": \"$agent_user_id\",\"username\": \"$bot_name\",\"count\": 0,\"order\": 0}]}"`
    echo "$rktres" | jq '.'
    ##CREATE WEBHOOK
    rktres=`curl -X POST https://$ROCKETCHAT_HOSTNAME/api/v1/integrations.create -H 'Content-Type: application/json' -H "X-Auth-Token: $rkttk" -H "X-User-Id: $rktuid" -d "{ \"type\": \"webhook-outgoing\", \"name\": \"Rasa\", \"event\": \"sendMessage\", \"enabled\": true, \"username\": \"$bot_name\", \"urls\": [\"http://chatbot:5005/webhooks/rocketchat/webhook\"], \"scriptEnabled\": true, \"channel\":\"all_direct_messages\" }"`
    echo "$rktres" | jq '.'

    read -n 1 -p $'\e[1;32m Now you have to properly configure the Identity Manager and the API manager and write correctly the env vars; when ready press (Y/n)\e[0m ' continue_install
    if [[ $continue_install =~ ^(y|Y|)$ ]]
    then
        echo "continuing the deployment"

        # TODO ask for vars to write in prod.env

        echo -e "\033[0;36m\nStarting MICADO applications' containers deployment\e[0m "
        (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d data_migrants)
        (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d data_pa)
        (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d data_ngo)
        echo -e "\033[0;36m\nStarted MICADO applications\e[0m "

    fi
    echo -e "\033[0;36m\nIf you need to monitor your deployment you can use portainer included in the deployment with the following command:\e[0m "
    echo "(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d portainer)"
    echo -e "\033[0;36m\nIf you need to access the DB you can start the pgadmin service with the following command:\e[0m "
    echo "(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d db_admin)"
fi

exit
