#!/bin/bash

# Not going to terminate if we run into error since set -e is not written
# set -e

# Packages we need to build
packages=(
  "integration-sdk-cli"
  "integration-sdk-core"
  "integration-sdk-entities"
  "integration-sdk-entity-validator"
  "integration-sdk-http-client"
  "integration-sdk-runtime"
  "integration-sdk-testing"
)

# Loop through each package and run build commands
for package in "${packages[@]}"; do
  echo "Building $package..."
  cd packages/$package
  npm run prebuild:dist
  npm run build:dist
  cd ../..
done

echo "All packages built successfully."
