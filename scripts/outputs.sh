#!/bin/bash

# This script retrieves the installed Node.js and pnpm versions
# and sets them as output variables for use in GitHub Actions.

# Get the current Node.js version and remove the leading 'v' character.
NODE_VERSION=$(node --version | sed 's/^v//')

# Get the current pnpm version.
PNPM_VERSION=$(pnpm --version)

# Print the versions for debugging purposes.
echo "Node: $NODE_VERSION"
echo "PNPM: $PNPM_VERSION"

# Set the Node.js version as a GitHub Actions output variable.
echo "node=$NODE_VERSION" >> "$GITHUB_OUTPUT"

# Set the pnpm version as a GitHub Actions output variable.
echo "pnpm=$PNPM_VERSION" >> "$GITHUB_OUTPUT"
