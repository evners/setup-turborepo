#!/bin/bash

# This script retrieves the installed Node.js and pnpm versions
# and sets them as output variables for use in GitHub Actions.

# If any command fails, the script will exit immediately.
set -e

# Get the current Node.js version and remove the leading 'v' character.
NODE_VERSION=$(node --version | sed 's/^v//')

# Get the current pnpm version.
PNPM_VERSION=$(pnpm --version)

# Try to get the current turbo version. If it fails, set it to "not installed".
if TURBO_VERSION=$(turbo --version 2>/dev/null); then
  :
else
  TURBO_VERSION="not-installed"
fi

# Print the versions for debugging purposes.
echo "node: $NODE_VERSION"
echo "pnpm: $PNPM_VERSION"
echo "turbo: $TURBO_VERSION"

# Set the Node.js version as a GitHub Actions output variable.
echo "node=$NODE_VERSION" >> "$GITHUB_OUTPUT"

# Set the pnpm version as a GitHub Actions output variable.
echo "pnpm=$PNPM_VERSION" >> "$GITHUB_OUTPUT"
