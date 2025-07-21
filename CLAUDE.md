# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Docker Compose-based infrastructure repository for managing containerized applications on a home NAS system. It contains Docker Compose configurations for various self-hosted services, not traditional application source code.

## Key Architecture Patterns

### Directory Structure
Each service has its own directory containing:
- `docker-compose.yml` or `compose.yml` - Service definition
- `.env` files - Environment-specific configuration (if needed)
- Service-specific configuration files

### Network Architecture
- **main-bridge**: External network for internet-accessible services
- **internal**: Internal network for inter-service communication
- Services accessible via reverse proxy at `*.fzymgc.house` domain

### Volume Mount Patterns
- Data: `/mnt/data/[service-name]/`
- Configuration: `/mnt/apps/[service-name]/`
- SSL certificates: `/mnt/apps/letsencrypt/` (read-only mounts)

### Security Patterns
- Capability dropping for enhanced container security
- OAuth integration via Authentik where applicable
- Read-only mounts for sensitive files (certificates)

## Common Commands

### Service Management
```bash
# Start a service
cd [service-directory]
docker compose up -d

# Stop a service
docker compose down

# View logs
docker compose logs -f

# Restart a service
docker compose restart

# Update service images
docker compose pull
docker compose up -d
```

### Debugging
```bash
# Check service status
docker compose ps

# Inspect service configuration
docker compose config

# Execute commands in container
docker compose exec [service-name] sh
```

## Working with Services

### Adding New Services
1. Create a new directory for the service
2. Add `docker-compose.yml` with standard patterns:
   - Use `restart: unless-stopped`
   - Configure appropriate networks
   - Follow volume mount patterns
   - Drop unnecessary capabilities

### Modifying Services
1. Check for `.env` files for environment-specific values
2. Ensure network connectivity requirements are met
3. Verify volume paths exist on the host
4. Test configuration with `docker compose config`

### Environment Variables
- Service-specific environment variables are typically in `.env` files
- OAuth/authentication credentials reference Authentik configuration
- Domain names follow pattern: `[service].fzymgc.house`

## Important Considerations

1. This is infrastructure configuration, not application development
2. Changes affect live services on a home NAS
3. Volume paths are specific to the NAS filesystem structure
4. Services may depend on external authentication (Authentik)
5. Renovate bot handles dependency updates automatically