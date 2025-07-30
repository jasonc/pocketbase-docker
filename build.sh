#!/bin/bash

# Get PocketBase version from argument or use default
PB_VERSION=${1:-"0.29.0"}

echo "Building PocketBase Docker image with version: $PB_VERSION"

# Build with specific version
docker build \
  --build-arg PB_VERSION=$PB_VERSION \
  -t jasonc/pocketbase:$PB_VERSION \
  -t jasonc/pocketbase:latest \
  .

echo "Build complete!"
echo "Images tagged as:"
echo "  - jasonc/pocketbase:$PB_VERSION"
echo "  - jasonc/pocketbase:latest"
