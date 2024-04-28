#!/bin/bash

# Parse the secrets and export them as environment variables
export_secrets() {
    # Export each secret as an environment variable
    export SECRET_KEY="foobarfoobar"
    export SERVER_PORT="9000"
    export DJANGO_CORS_ALLOWED_ORIGINS="http://localhost:7777,http://localhost:9000,http://localhost:7777,http://localhost:9000"
    export DJANGO_ALLOWED_HOSTS="localhost"
    export POSTGRES_USER="user"
    export POSTGRES_PASSWORD="12345"
    export POSTGRES_DB="skill_atlas"
    export DB_HOST="db"
    export DB_PORT="5432"
    export DJANGO_SETTINGS_MODULE="career_skill_atlas.config.base_settings"
    export CHOKIDAR_USEPOLLING="false"
    export URL="http://localhost"
    export VITE_BACKEND_URL="http://localhost:80/api"
    export PORT="7777"
}

# Call the function to export the secrets
export_secrets

# Print the exported environment variables
echo "Exported secrets:"
env | grep -E '(SECRET_KEY|SERVER_PORT|DJANGO_CORS_ALLOWED_ORIGINS|DJANGO_ALLOWED_HOSTS|POSTGRES_USER|POSTGRES_PASSWORD|POSTGRES_DB|DB_HOST|DB_PORT|DJANGO_SETTINGS_MODULE|CHOKIDAR_USEPOLLING|URL|VITE_BACKEND_URL|PORT)'
