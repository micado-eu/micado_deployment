This is the repository that hosts the deployment environment for the MICADO platform

# MICADO platform
MICADO platform offers a set of backend components integrated and exposed through three applications targeted to 3 stackeholders groups:
1. Migrants
2. Public Administration
3. NGO

## Deployment instructions
To execute the MICADO platform clone the repository and execute docker-compose.

To have a correct working instance you have to properly configure hostnames.  Given a target domain <MY_DOMAIN> the hostnames that should be created are:
1. migrants.<MY_DOMAIN> (this hostname will have to be assigned to the MICADO app for the migrants)
2. pa.<MY_DOMAIN> (this hostname will have to be assigned to the Public Administration web application)
3. ngo.<MY_DOMAIN> (this hostname will have to be used for the Non Governative Organizations web application)
4. gateway.<MY_DOMAIN> (this hostname is needed to the API gateway that is one of the backend components with which the 3 frontend application will talk to)
5. dashboard.<MY_DOMAIN> (this hostname is needed for the dashboarding backend application)
6. upload.<MY_DOMAIN> (this hostname is needed for the upload service)

### Development execution
In development to execute all services run

``
./start_env.sh
``
In any case it is rare that in development the developer will need all the services running so it is better to start only the ones that are needed with a command like the one below

``
docker-compose -f docker-compose.yml -f docker-compose-local_dev.yaml up -d micado_db
``


### Production execution
Create a prod.env file with this content:

```
WSO2_API_ADMIN_PWD=secretpassword1
WSO2_IDENTITY_ADMIN_PWD=secretpassword2
WSO2_IDENTITY_PWD=secretpassword3
WSO2_SHARED_PWD=secretpassword4
WSO2_API_PWD=secretpassword5
MICADO_DB_PWD=secretpassword6

PGADMIN_DEFAULT_PASSWORD=secretpassword7

# -------- DATABASE PART --------
POSTGRES_PASSWORD=secretpassword8

# -------- WEBLATE PART ----------
# Weblate setup
WEBLATE_ADMIN_PASSWORD=secretpassword9

# PostgreSQL setup
WEBLATE_POSTGRES_PASSWORD=secretpassword10
WEBLATE_EMAIL_HOST_PASSWORD=secretpassword11
GITEA_DB_PWD=secretpassword12
MICADO_GIT_URL=http://xxxxx%40csi.it:pwd@git:3000/micadoadmin/backend.git

# ------- ENV vars for javascript apps
MICADO_API_KEY=api_key
ROCKETCHAT_ADMIN_PWD=xxx
ROCKETCHAT_USER=rasa_bot
ROCKETCHAT_PASSWORD=micadobot
RESPOND_TO_LIVECHAT=true

COUNTLY_MIGRANTS_APP_ID=xxx
COUNTLY_MIGRANTS_API_KEY=xxxx


```

Than execute the following command:

``
./start_env_prod.sh
``

### Funded by

![EU Logo](https://github.com/micado-eu/MICADO/blob/master/img/Flag_of_Europe.svg_.png)This project has received funding from the European Union’s H2020 Innovation Action under Grant Agreement No 822717.
