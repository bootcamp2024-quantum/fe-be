#!/bin/bash

# Set the name of the secret
secretName="career_skill_atlas_secret"

# Retrieve the entire JSON object from AWS Secrets Manager
secretValue=$(aws secretsmanager get-secret-value --secret-id "$secretName" --query "SecretString" --output text)

if [[ $? -eq 0 ]]; then
    echo "Retrieving secrets from AWS Secrets Manager..."

    # Extract individual secrets from the JSON object
    while IFS= read -r line; do
        secretName=$(echo "$line" | cut -d':' -f1 | tr -d '[:space:]')
        secretValue=$(echo "$line" | cut -d':' -f2- | tr -d '[:space:]' | sed 's/^"\(.*\)"$/\1/')
        if [[ ! -z "$secretName" && ! -z "$secretValue" ]]; then
            # Set the secret as an environment variable
            export "$secretName"="$secretValue"
            echo "Secret '$secretName' set as an environment variable."
        fi
    done <<< "$(echo "$secretValue" | jq -r 'to_entries[] | "\(.key):\(.value)"')"
else
    echo "Failed to retrieve secrets from AWS Secrets Manager."
fi

# Display the retrieved secrets
echo "Retrieved secrets:"
echo "$secretValue"
