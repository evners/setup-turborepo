#!/bin/bash

# ----------------------------------------------------------------------------------------------------
# This script extracts the Node.js version from the package.json file and sets it as an output
# variable for GitHub Actions. It uses jq to parse the JSON and retrieve the "engines.node" field.
# ----------------------------------------------------------------------------------------------------

# Step 1: Verify if package.json exists in the current directory.
if [ ! -f package.json ]; then
    echo "✘ package.json not found!"
    # If not found, exit the script with an error code 1.
    exit 1
fi

# Step 2: Extract the Node.js version specified under the "engines" field in package.json.
# -r : Output raw strings instead of JSON-encoded strings.
# // empty : If the "engines.node" field is missing, return an empty string instead of "null".
NODE_VERSION=$(jq -r '.engines.node // empty' package.json)

# Step 3: Check if a Node.js version was successfully extracted.
if [ -z "$NODE_VERSION" ]; then
    echo "✘ No 'engines.node' field found in package.json."
    # If empty, exit the script with an error code 1.
    exit 1
fi

# Step 4: Set the extracted Node.js version as a GitHub Actions output variable.
# This output can be accessed in subsequent workflow steps using "steps.<step-id>.outputs.result".
echo "result=$NODE_VERSION" >> "$GITHUB_OUTPUT"
