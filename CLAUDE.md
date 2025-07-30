# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Docker containerization project for PocketBase, providing a lightweight Alpine Linux-based container that runs PocketBase v0.29.0. The project includes both a Dockerfile for building custom images and Docker Compose configuration for easy deployment.

## Common Commands

### Building and Running
- `./build.sh` - Build the Docker image as `jasonc/pocketbase:latest`
- `./build.sh 0.30.0` - Build with specific PocketBase version
- `docker-compose up -d` - Start PocketBase container in detached mode
- `docker-compose down` - Stop and remove the PocketBase container
- `docker-compose logs -f pocketbase` - View container logs

### Development
- `npm install` - Install Node.js dependencies (PocketBase JavaScript SDK)

## Architecture

### Container Configuration
- **Base Image**: Alpine Linux (minimal footprint)
- **PocketBase Version**: Configurable via `PB_VERSION` build arg (default: 0.29.0)
- **Exposed Port**: 8090 (PocketBase HTTP server)
- **Data Persistence**: Volume mount required at `/pb/pb_data`

### Key Files
- `Dockerfile`: Multi-stage build downloading PocketBase binary from GitHub releases
- `compose.yaml`: Production-ready container configuration with volume mounts
- `build.sh`: Simple build script for creating the Docker image
- `package.json`: Contains PocketBase JavaScript SDK dependency

### Volume Mounts
The Docker Compose setup includes three important volume mounts:
- `./pb_data:/pb/pb_data` - Database and uploaded files storage
- `./pb_migrations:/pb/pb_migrations` - Database migration files
- `./pb_hooks:/pb/pb_hooks` - Server-side JavaScript hooks

### Customization Points
- Uncomment lines 14 and 17 in Dockerfile to include migrations and hooks in the image
- Adjust `PB_VERSION` build argument to use different PocketBase versions
- Modify port mapping in compose.yaml if needed (currently 8090:8090)

## Automated Builds

The project includes GitHub Actions workflow for automatically building Docker images when new PocketBase releases are published.

### Setup Requirements
To enable automated builds, configure these GitHub repository secrets:
- `DOCKER_USERNAME` - Your Docker Hub username
- `DOCKER_PASSWORD` - Your Docker Hub access token

### How It Works
- Checks daily for new PocketBase releases
- Compares with existing Docker Hub tags to avoid duplicate builds
- Builds multi-architecture images (amd64, arm64) when new versions are detected
- Tags images with both specific version and 'latest'
- Creates GitHub releases to track build history

### Manual Triggering
You can manually trigger a build from the GitHub Actions tab using the "workflow_dispatch" trigger.