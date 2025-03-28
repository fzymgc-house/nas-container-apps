# NAS Container Applications


This repository contains Docker Compose definitions for various applications running on my NAS. These configurations are designed to be deployed on a home network storage (NAS) system, providing a centralized and organized way to manage containerized services.

## Structure

Each application has its own directory containing:
- `docker-compose.yml`: The main configuration file defining the service(s)
- Additional configuration files specific to the application

## Applications

### DNS Proxy
A DNSCrypt proxy service that provides encrypted DNS resolution, enhancing privacy and security for the network.

### NAS Apps Proxy
A Caddy reverse proxy service that provides secure HTTPS access to various NAS applications, with automatic SSL certificate management and unified access point.

## Usage

To deploy any of these applications:

1. Navigate to the application directory
2. Run `docker compose up -d` to start the services
3. Use `docker compose down` to stop the services

## Network Configuration

The applications are configured to work with specific Docker networks:
- `main-bridge`: The primary network for external access
- `dnscrypt-proxy`: A dedicated network for DNS-related services

## Requirements

- Docker
- Docker Compose
- NAS with Docker support
