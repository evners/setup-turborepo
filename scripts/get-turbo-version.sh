#!/bin/bash

# This script extracts the Turbo version from the package.json file and sets it as an output
# variable for GitHub Actions. It uses jq to parse the JSON and retrieve the "turbo" field from
# the "devDependencies" section.

# If any command fails, the script will exit immediately.
set -e

# Step 1: Verify if package.json exists in the current directory.
if [ ! -f package.json ]; then
    echo "✘ package.json not found!"
    exit 1 # If not found, exit the script with an error code 1.
fi

# Step 2: Extract the Turbo version specified under the "devDependencies" field in package.json.
TURBO_VERSION=$(jq -r '.devDependencies["turbo"]' package.json | sed 's/[^0-9.]//g')

# Step 3: Check if a Turbo version was successfully extracted.
if [[ -z "$TURBO_VERSION" ]]; then
  echo "Turbo version not found in package.json"
  exit 1 # If empty, exit the script with an error code 1.
fi 

# Step 4: Set the extracted Turbo version as a GitHub Actions output variable.
echo "result=$TURBO_VERSION" >> "$GITHUB_OUTPUT"
