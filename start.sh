#!/bin/bash

echo -e "\033[0;36m\nStarting MICADO DB\e[0m "
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d micado_db)
sleep 25
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs micado_db)

echo -e "\033[0;36m\nStarting Mongo\e[0m "
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d mongodb)
sleep 15
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs mongodb)

(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d balancer)
sleep 15

(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d identity_server)
sleep 25
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs identity_server)

(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d cache)
sleep 15
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d git)
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d weblate)
sleep 25
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs weblate)
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
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d chatbot_en)
sleep 25
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs chatbot_en)
echo -e "\033[0;36m\nStarted Chatbot\e[0m "

# ROCKETCHAT
echo -e "\033[0;36m\nStarting Rocketchat container deployment\e[0m "
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d rocketchat)
sleep 55
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml logs rocketchat)
echo -e "\033[0;36m\nStarted ROCKETCHAT\e[0m "

echo -e "\033[0;36m\nStarting MICADO applications' containers deployment\e[0m "
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d data_migrants)
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d data_pa)
(set -a; source prod.env; set +a; docker-compose -f docker-compose-prod.yaml up -d data_ngo)
echo -e "\033[0;36m\nStarted MICADO applications\e[0m "
