# PocketBase Docker

**Lightweight Alpine-based Docker image for [PocketBase](https://pocketbase.io/) - an open source backend in a single file.**

Multi-architecture support (amd64, arm64) with automated builds tracking PocketBase releases. Features minimal Alpine Linux base (~45MB), persistent data volumes, and easy deployment via Docker Compose.

## Quick Start

```bash
docker run -d -p 8090:8090 -v ./pb_data:/pb/pb_data jasonc/pocketbase:latest
```

## Features

- Minimal footprint Alpine Linux base
- Automated builds for new PocketBase releases
- Multi-architecture support (amd64, arm64)
- Persistent data volume support
- Simple Docker Compose deployment
- Configurable PocketBase version via build args

## GitHub

https://github.com/jasonc/pocketbase-docker

## Available Tags

Available versions match official PocketBase releases (e.g., `0.29.0`, `0.30.0`, `latest`)

## Docker Compose Example

```yaml
services:
  pocketbase:
    image: jasonc/pocketbase:latest
    ports:
      - "8090:8090"
    volumes:
      - ./pb_data:/pb/pb_data
      - ./pb_migrations:/pb/pb_migrations
      - ./pb_hooks:/pb/pb_hooks
```

## Build Your Own

```bash
docker build --build-arg PB_VERSION=0.30.0 -t my-pocketbase .
```
