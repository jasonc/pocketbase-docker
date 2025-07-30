# PocketBase Docker

A lightweight Docker containerization for PocketBase, providing an Alpine Linux-based container that runs PocketBase with easy deployment options.

## Quick Start

### Using Docker Compose (Recommended)

```bash
# Start PocketBase container
docker compose up -d

# View logs
docker compose logs -f

# Stop container
docker compose down
```

PocketBase will be accessible at `http://localhost:8090`

### Building Custom Image

```bash
# Build with default PocketBase version (0.29.0)
./build.sh

# Build with specific version
./build.sh 0.30.0
```

## Configuration

### Volume Mounts

The Docker Compose setup includes three important volume mounts:

- `./pb_data:/pb/pb_data` - Database and uploaded files storage
- `./pb_migrations:/pb/pb_migrations` - Database migration files  
- `./pb_hooks:/pb/pb_hooks` - Server-side JavaScript hooks

### Port Configuration

- **Default Port**: 8090
- Modify port mapping in `compose.yaml` if needed

### PocketBase Version

- **Default**: v0.29.0
- Configurable via `PB_VERSION` build argument
- See [PocketBase releases](https://github.com/pocketbase/pocketbase/releases) for available versions

## Architecture

- **Base Image**: Alpine Linux (minimal footprint)
- **Multi-stage Build**: Downloads PocketBase binary from GitHub releases
- **Exposed Port**: 8090 (PocketBase HTTP server)
- **Data Persistence**: Requires volume mount at `/pb/pb_data`

## Customization

### Including Migrations and Hooks in Image

Uncomment lines 14 and 17 in the Dockerfile to include migrations and hooks directly in the image:

```dockerfile
# COPY pb_migrations /pb/pb_migrations
# COPY pb_hooks /pb/pb_hooks
```

## Automated Builds

This project includes GitHub Actions for automatically building Docker images when new PocketBase releases are published.

### Setup

Configure these GitHub repository secrets:
- `DOCKER_USERNAME` - Your Docker Hub username
- `DOCKER_PASSWORD` - Your Docker Hub access token

### Features

- Daily checks for new PocketBase releases
- Multi-architecture builds (amd64, arm64)
- Automatic tagging with version and 'latest'
- Manual trigger support via GitHub Actions

## Commands Reference

```bash
# Build commands
./build.sh                    # Build with default version
./build.sh 0.30.0             # Build with specific version

# Docker Compose commands
docker compose up -d    # Start in detached mode
docker compose down     # Stop and remove container
docker compose logs     # Follow logs
```

## License

This project is open source. PocketBase itself is distributed under the MIT License.
