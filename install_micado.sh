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

    echo -e "\033[0;34m\nPreparing certificates for the Identity Server\e[0m "
    set -a; source prod.env; set +a;
    set -a; source .env; set +a;
    cp templates/*.jks deployment/
    keytool -genkey -alias micado -keyalg RSA -keysize 2048 -keystore deployment/wso2carbon.jks -storepass wso2carbon -keypass ws2carbon -keyalg RSA -validity 3650 -dname "CN=$IDENTITY_HOSTNAME, OU=micado, O=Micado, L=TO, ST=TO, C=EU"
    keytool -list -v -storepass wso2carbon -keystore deployment/wso2carbon.jks|grep "micado"
    keytool -export -alias micado -storepass wso2carbon -keystore deployment/wso2carbon.jks -file deployment/micado.pem
    keytool -import -alias micado -storepass wso2carbon -file deployment/micado.pem -keystore deployment/client-truststore.jks -noprompt

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
    sleep 15
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs rocketchat)
    echo -e "\033[0;36m\nStarted ROCKETCHAT\e[0m "


    read -n 1 -p $'\e[1;32m
    Now you have to pro#!/bin/bash
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
    sleep 50
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs identity_server)
    echo -e "\033[0;36m\nStarted Identity Server\e[0m "

# Configure IDENTITY SERVER
# Generate random key for migrants service provider
#NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
#Add tenant PA
#curl --write-out "%{http_code}\n" -X POST https://identity.micadoproject.eu/services/TenantMgtAdminService.TenantMgtAdminServiceHttpsSoap11Endpoint/  -H 'Content-Type: text/xml'   -H 'Authorization: Basic YWRtaW5AcGEubWljYWRvLmV1Om1pY2Fkb2FkbTIwMjA='   -H 'SOAPAction: urn:addTenant'   -d '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://services.mgt.tenant.carbon.wso2.org" xmlns:xsd="http://beans.common.stratos.carbon.wso2.org/xsd">
   <soapenv:Header/>
   <soapenv:Body>
      <ser:addTenant>
         <ser:tenantInfoBean>
            <xsd:active>true</xsd:active>
            <xsd:admin>admin</xsd:admin>
            <xsd:adminPassword>$password</xsd:adminPassword>
            <xsd:createdDate></xsd:createdDate>
            <xsd:email>$email</xsd:email>
            <xsd:firstname>$firstname</xsd:firstname>
            <xsd:lastname>$lastname</xsd:lastname>
            <xsd:originatedService></xsd:originatedService>
            <xsd:successKey></xsd:successKey>
            <xsd:tenantDomain>pa.micado.eu</xsd:tenantDomain>
            <xsd:tenantId>1</xsd:tenantId>
            <xsd:usagePlan></xsd:usagePlan>
         </ser:tenantInfoBean>
      </ser:addTenant>
   </soapenv:Body>
</soapenv:Envelope>'
# Configure the pa_sp to allow users to manage their login
#curl --write-out "%{http_code}\n" -X POST https://identity.micadoproject.eu/services/RemoteAuthorizationManagerService.RemoteAuthorizationManagerServiceHttpsSoap11Endpoint/   -H 'Content-Type: text/xml'   -H 'Authorization: Basic YWRtaW5AcGEubWljYWRvLmV1Om1pY2Fkb2FkbTIwMjA='   -H 'SOAPAction: urn:authorizeRole'   -d '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.ws.um.carbon.wso2.org"><soapenv:Header/><soapenv:Body><ser:authorizeRole><ser:roleName>Application/pa_sp</ser:roleName><ser:resourceId>/permission/admin/login</ser:resourceId><ser:action>ui.execute</ser:action></ser:authorizeRole></soapenv:Body></soapenv:Envelope>'

    # WEBLATE
    echo -e "\033[0;36m\nStarting WEBLATE containers deployment\e[0m "
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d cache)
    sleep 15
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d git)
    sleep 15
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
    sleep 15
    (set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs rocketchat)
    echo -e "\033[0;36m\nStarted ROCKETCHAT\e[0m "


    read -n 1 -p $'\e[1;32m
    Now you have to properly configure the Identity Manager and the API manager and write correctly the env vars; when ready press (Y/n)\e[0m ' continue_install
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