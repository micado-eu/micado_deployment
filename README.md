This is the repository that hosts the deployment environment for the MICADO platform.


# MICADO Platform Architecture

The MICADO platform is composed of several services grouped into different clusters. Each cluster represents a logical component of the architecture, such as the database, identity management, web components, backend components, and admin tools.


## Database

- micado_db: This service uses a PostgreSQL database with Groonga extensions. It stores persistent data required by various MICADO components. The health check ensures the database is ready before dependent services start.

## Auth

- keycloak: Keycloak is an identity and access management solution for modern applications and services. It handles authentication and authorization for the MICADO platform, ensuring secure access to resources.

## MICADO Frontend

- nginx: Nginx acts as a web server and reverse proxy. It serves static content and forwards requests to other services based on the configured rules. It is essential for handling web traffic and load balancing.
- data_migrants: This frontend application provides a user interface tailored for migrants. It is built using modern web technologies and serves static content relevant to migrant users.
- data_pa: Similar to data_migrants, this service provides a frontend application for public administrators, serving specific content and functionality for their use.
- data_ngo: This service provides a frontend application for non-governmental organizations (NGOs), offering tailored content and features.

## Load Balancer

- traefik: Traefik is a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. It automatically discovers services and configures routing, providing SSL termination and other essential load-balancing features.

## MICADO Backend

- backend: The backend service of the MICADO platform handles business logic, processes data, and interacts with the database. It exposes APIs consumed by the frontend applications and other services.

## Translation Platform

- git: A Gitea instance that serves as a Git server for version control. It hosts the code repositories for the MICADO platform, facilitating collaboration and version management.
- weblate: Weblate is a web-based translation tool with tight version control integration. It manages translations for the MICADO platform, ensuring that all content is available in multiple languages.
- cache: Redis is an in-memory data structure store used as a cache by Weblate to improve performance and handle high-speed data operations.

## Admin

- portainer: Portainer is a lightweight management UI that allows easy management of Docker environments. It provides a web interface for managing containers, images, networks, and volumes.


Sure! Let's adjust the description to focus on the MICADO platform, describe the `.env` file used by Docker Compose, and provide an example `.env` file based on the environment variables used in the Compose file.

### MICADO Platform Folder Structure

```
micado_platform/
├── db_data/
├── db_init/
├── keycloak/
│   ├── realm.json
│   ├── themes/
├── nginx/
│   ├── run.sh
│   ├── customcss/
│   ├── nginx.conf
├── git_data/
├── translations_dir/
├── shared_images/
├── traefik/
│   ├── traefik-acme/
├── weblate_data/
├── redis_data/
├── portainer-data/
├── .env
```

### Explanation of Folders

#### db_data/
- **Purpose**: Stores the persistent data for the PostgreSQL database used by the `micado_db` service.
- **Content**: 
  - All database files and data required for the operation of the PostgreSQL database.
  - Ensures that the database data persists across container restarts and recreations.

#### db_init/
- **Purpose**: Contains initialization scripts for the PostgreSQL database.
- **Content**:
  - SQL scripts and other initialization files that are executed when the database is first created.
  - Used to set up initial database schemas, tables, and seed data.

#### keycloak/realm.json
- **Purpose**: JSON file used by the Keycloak service to import realm configurations.
- **Content**:
  - Defines realm settings, users, clients, and other configurations for the Keycloak identity and access management service.
  - Automatically imported during Keycloak startup to configure the realm.

#### keycloak/themes/
- **Purpose**: Directory for storing custom themes for the Keycloak service.
- **Content**:
  - Custom HTML, CSS, and other assets to style the Keycloak login pages and account management console.
  - Allows for branding and customization of the Keycloak interface.

#### nginx/run.sh
- **Purpose**: Script used by the Nginx service to start the server.
- **Content**:
  - Shell script containing commands to start and configure the Nginx web server.
  - **Steps Performed**:
    1. **Echo Environment Variables**:
        ```sh
        echo "managing env variables"
        ```
        - Logs a message indicating the start of environment variable management.
    2. **Print All Environment Variables**:
        ```sh
        env
        ```
        - Prints all the current environment variables to the console for debugging purposes.
    3. **Substitute Environment Variables in Config Files**:
        ```sh
        envsubst '${MIGRANTS_HOSTNAME} ${PA_HOSTNAME} ${NGO_HOSTNAME} ${ANALYTIC_HOSTNAME} ${RASA_HOSTNAME}' < /usr/local/openresty/nginx/conf/nginx.conf.template > /usr/local/openresty/nginx/conf/nginx.conf
        ```
        - Uses `envsubst` to replace placeholders in the Nginx configuration template with actual environment variable values.
    4. **Print the Resulting Configuration File**:
        ```sh
        cat /usr/local/openresty/nginx/conf/nginx.conf 
        ```
        - Prints the generated Nginx configuration file to the console for verification.
    5. **Start OpenResty**:
        ```sh
        echo "starting openresty"
        /usr/bin/openresty
        ```
        - Logs a message indicating the start of OpenResty and then starts the OpenResty web server.

#### nginx/customcss/
- **Purpose**: Directory for storing custom CSS files used by the Nginx service.
- **Content**:
  - Custom CSS files to style the web content served by Nginx.
  - Allows for customization of the appearance of the websites and applications served by Nginx.

#### nginx/nginx.conf
- **Purpose**: Nginx configuration file template used by the Nginx service.
- **Content**:
  - Configuration directives for the Nginx web server, such as server blocks, proxy settings, and security configurations.
  - Template may include placeholders for environment variable substitution.

#### git_data/
- **Purpose**: Stores data for the Gitea Git server.
- **Content**:
  - Git repositories, configuration files, and other persistent data required by the Gitea service.
  - Ensures that repositories and Gitea configurations persist across container restarts and recreations.

#### translations_dir/
- **Purpose**: Directory for storing translation files used by the Weblate service.
- **Content**:
  - Translation files for various languages and projects managed by Weblate.
  - Ensures that translation data persists across container restarts and recreations.

#### shared_images/
- **Purpose**: Directory for storing shared images that are accessible by multiple services.
- **Content**:
  - Image files and assets that need to be accessed by multiple services, such as backend and frontend applications.
  - Facilitates the sharing of image assets across different parts of the platform.

#### traefik/traefik-acme/
- **Purpose**: Directory for storing SSL certificates used by the Traefik service.
- **Content**:
  - SSL certificates and ACME challenge data used by Traefik to manage HTTPS connections.
  - Ensures that SSL certificates persist across container restarts and recreations.

#### weblate_data/
- **Purpose**: Stores persistent data for the Weblate service.
- **Content**:
  - Translation data, configuration files, and other data required by Weblate.
  - Ensures that Weblate's data persists across container restarts and recreations.

#### redis_data/
- **Purpose**: Stores persistent data for the Redis service used as a cache by Weblate.
- **Content**:
  - Redis data files for caching and other in-memory data operations.
  - Ensures that Redis data persists across container restarts and recreations.

#### portainer-data/
- **Purpose**: Stores persistent data for the Portainer service.
- **Content**:
  - Configuration files, management data, and state information for Portainer.
  - Ensures that Portainer's data persists across container restarts and recreations.

### .env File

The `.env` file is used to store environment variables required by the Docker Compose services. This file should be located in the root of the `micado_platform` directory.
This env file will be written by the MICADO installer.

#### Example .env File

```env
# PostgreSQL Configuration
POSTGRES_DB=micado                # The name of the PostgreSQL database
POSTGRES_USER=micado_user         # The PostgreSQL database user
POSTGRES_PASSWORD=micado_password # The password for the PostgreSQL database user

# Keycloak Configuration
KEYCLOAK_IMAGE_TAG=latest         # The Docker image tag for the Keycloak image
KEYCLOAK_DB_USER=micado_keycloak  # The database user for Keycloak
KEYCLOAK_DB_SCHEMA=public         # The database schema for Keycloak
KC_LOG_LEVEL=INFO                 # The log level for Keycloak
KC_REALM_NAME=micado_realm        # The realm name for Keycloak
KEYCLOAK_ADMIN=admin              # The admin username for Keycloak
KEYCLOAK_ADMIN_PASSWORD=admin_password # The admin password for Keycloak
IDENTITY_HOSTNAME=identity.micado.local # The hostname for the Keycloak identity server
MIGRANTS_HOSTNAME=migrants.micado.local # The hostname for the Migrants application
PA_HOSTNAME=pa.micado.local       # The hostname for the Public Administration application
NGO_HOSTNAME=ngo.micado.local     # The hostname for the NGO application

# Nginx Configuration
NGINX_IMAGE_TAG=latest            # The Docker image tag for the Nginx image
ANALYTIC_HOSTNAME=analytics.micado.local # The hostname for the analytics application
RASA_HOSTNAME=rasa.micado.local   # The hostname for the Rasa application
BOT_NAME=micado_bot               # The name of the bot used by Rasa

# Traefik Configuration
TRAEFIK_IMAGE_TAG=latest          # The Docker image tag for the Traefik image
TRAEFIK_LOG_LEVEL=DEBUG           # The log level for Traefik
TRAEFIK_ACME_EMAIL=your-email@example.com # The email used for ACME certificate registration
TRAEFIK_HOSTNAME=traefik.micado.local # The hostname for the Traefik dashboard

# Git Configuration
GIT_HOSTNAME=git.micado.local     # The hostname for the Gitea Git server
GITEA_IMAGE_TAG=latest            # The Docker image tag for the Gitea image
GITEA_DB_USER=gitea_user          # The database user for Gitea
GITEA_DB_PWD=gitea_password       # The password for the Gitea database user
GITEA_DB_SCHEMA=public            # The database schema for Gitea

# Weblate Configuration
WEBLATE_IMAGE_TAG=latest          # The Docker image tag for the Weblate image
WEBLATE_EMAIL_HOST=smtp.micado.local # The email host for Weblate
WEBLATE_EMAIL_HOST_USER=weblate_user # The email host user for Weblate
WEBLATE_SERVER_EMAIL=weblate@micado.local # The server email for Weblate
WEBLATE_DEFAULT_FROM_EMAIL=weblate@micado.local # The default from email for Weblate
WEBLATE_ALLOWED_HOSTS=*           # Allowed hosts for Weblate
WEBLATE_ADMIN_PASSWORD=weblate_admin_password # The admin password for Weblate
WEBLATE_ADMIN_NAME=admin          # The admin name for Weblate
WEBLATE_ADMIN_EMAIL=weblate_admin@micado.local # The admin email for Weblate
TRANSLATION_HOSTNAME=translation.micado.local # The hostname for the translation platform
WEBLATE_REGISTRATION_OPEN=true    # Whether registration is open on Weblate
WEBLATE_POSTGRES_PASSWORD=weblate_db_password # The password for the Weblate PostgreSQL user
WEBLATE_POSTGRES_USER=weblate_db_user # The Weblate PostgreSQL user
WEBLATE_POSTGRES_HOST=micado_db   # The PostgreSQL host for Weblate
WEBLATE_POSTGRES_PORT=5432        # The PostgreSQL port for Weblate
WEBLATE_WORKERS=2                 # The number of worker processes for Weblate
TZ=Europe/Berlin                  # The timezone for Weblate

# Redis Configuration
REDIS_IMAGE_TAG=latest            # The Docker image tag for the Redis image

# Backend Configuration
MICADO_BACKEND_IMAGE_TAG=latest   # The Docker image tag for the backend image
MICADO_GIT_URL=https://github.com/micado-eu/micado # The Git URL for the MICADO backend
ROCKETCHAT_HOSTNAME=rocketchat.micado.local # The hostname for Rocket.Chat
ROCKETCHAT_ADMIN=rocketchat_admin # The admin user for Rocket.Chat
ROCKETCHAT_ADMIN_PWD=rocketchat_password # The admin password for Rocket.Chat
MICADO_TRANSLATIONS_DIR=/translations # The directory for translations in the MICADO backend
COUNTLY_MIGRANTS_APP_ID=countly_app_id # The app ID for Countly (migrants)
COUNTLY_MIGRANTS_API_KEY=countly_api_key # The API key for Countly (migrants)
MICADO_DB_PWD=micado_db_password  # The password for the MICADO database user
MICADO_DB_USER=micado_db_user     # The MICADO database user
MICADO_DB_SCHEMA=public           # The database schema for the MICADO database
MICADO_ENV=development            # The environment for the MICADO backend
WEBLATE_EMAIL_HOST=smtp.micado.local # The email host for Weblate
WEBLATE_EMAIL_HOST_USER=weblate_user # The email host user for Weblate
WEBLATE_EMAIL_HOST_SSL=true       # Whether to use SSL for the Weblate email host
WEBLATE_EMAIL_HOST_PASSWORD=weblate_password # The password for the Weblate email host user
ANALYTIC_HOSTNAME=analytics.micado.local # The hostname for the analytics application
COUNTLY_ADMIN=countly_admin       # The admin user for Countly
COUNTLY_ADMIN_PWD=countly_password # The admin password for Countly
ALGORITHM=HS256                   # The algorithm used for security
SALT=salt_value                   # The salt value used for hashing
KEY_LENGTH=32                     # The key length for security
BUFFER_0=buffer_value_0           # Buffer value 0
BUFFER_1=buffer_value_1           # Buffer value 1
ALGORITHM_PASSWORD=algorithm_password # The algorithm password
MICADO_WEBLATE_KEY=weblate_key    # The key for Weblate integration

# Portainer Configuration
PORTAINER_IMAGE_TAG=latest        # The Docker image tag for the Portainer image
PORTAINER_HOSTNAME=portainer.micado.local # The hostname for the Portainer dashboard
```


# Deployment Instructions

To execute the MICADO platform, there is the MICADO installer that will use the release from this repository to properly generate the required environment. Follow the steps below to deploy the MICADO platform.

## Prerequisites

Before starting the deployment, ensure you have the following prerequisites:

- Docker installed on your system.
- Docker Compose installed on your system.
- Access to the internet to download Docker images and the MICADO installer.

## Step-by-Step Deployment

### Step 1: Download the MICADO Installer

Download the MICADO installer from the official GitHub releases page:

[Download MICADO Installer](https://github.com/micado-eu/installer/releases)

### Step 2: Run the MICADO Installer

1. **Make the Installer Executable:**

    ```sh
    chmod +x micado_install
    ```

2. **Run the Installer to Prepare the Environment:**

    ```sh
    ./micado_install prepare --release <release_name> --path <installation_path>
    ```

    This command will:
    - Download the specified release of `micado-deployment`.

### Step 3: Configure the Unzipped Content

1. **Run the Installer to Configure the Environment:**

    ```sh
    ./micado_install configure --config-file <config_file_path> --path <installation_path>
    ```

    This command will:
    - Configure the content of the unzipped files based on the provided configuration file.
    - Generate the `.env` file using a Jinja2 template found in the `micado-deployment` release.
    - Prepare the MICADO environment by configuring all necessary components.

### Step 4: Deploy the MICADO Platform

1. **Run the Installer to Deploy the Services:**

    ```sh
    ./micado_install deploy --docker-compose <docker_compose_file_path>
    ```

    This command will:
    - Execute Docker commands using the `docker-compose.yaml` file located in the specified directory to start all the services.

### Step 5: Verify the Deployment

1. **Check the Status of the Services:**

    ```sh
    docker-compose ps
    ```

    Ensure all services are running and healthy.

2. **Access the MICADO Platform:**

    Open your browser and navigate to the configured hostnames to access different parts of the MICADO platform (hostnames will reflect the information given to the installer):

    - **Keycloak**: `https://identity.micado.local`
    - **Migrants Application**: `https://migrants.micado.local`
    - **Public Administration Application**: `https://pa.micado.local`
    - **NGO Application**: `https://ngo.micado.local`
    - **Analytics**: `https://analytics.micado.local`
    - **Git Server**: `https://git.micado.local`
    - **Translation Platform**: `https://translation.micado.local`
    - **Portainer Dashboard**: `https://portainer.micado.local`

## Conclusion

By following these instructions, you will have deployed the MICADO platform using the provided installer and Docker Compose configuration. The installer will handle the generation of the `.env` file from a Jinja2 template, ensuring all necessary environment variables are set. If you encounter any issues, refer to the logs of individual services using `docker-compose logs <service_name>` for troubleshooting.


### Funded by

![EU Logo](https://github.com/micado-eu/MICADO/blob/master/img/Flag_of_Europe.svg_.png)This project has received funding from the European Union’s H2020 Innovation Action under Grant Agreement No 822717.
