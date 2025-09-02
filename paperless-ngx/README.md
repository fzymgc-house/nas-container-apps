# Paperless-ngx Setup

This directory contains the Docker Compose configuration for Paperless-ngx, a community-supported supercharged document management system.

## Services

- **webserver**: The main Paperless-ngx application
- **db**: PostgreSQL 17 database for storing metadata
- **valkey**: Valkey (Redis-compatible) for task queue and caching
- **tika**: Apache Tika for document text extraction
- **gotenberg**: Gotenberg for PDF generation and conversion

## Setup Instructions

1. **Create the .env file**: Copy the environment variables below into a `.env` file in this directory:

```bash
# User mapping
USERMAP_UID=1000
USERMAP_GID=1000

# Security
PAPERLESS_SECRET_KEY=change-me-to-a-very-long-random-string

# Timezone
PAPERLESS_TIME_ZONE=America/New_York

# OCR Language
PAPERLESS_OCR_LANGUAGE=eng

# Database (PostgreSQL 17)
POSTGRES_DB=paperless
POSTGRES_USER=paperless
POSTGRES_PASSWORD=change-me-to-a-secure-password

# Admin user (created on first run)
PAPERLESS_ADMIN_USER=admin
PAPERLESS_ADMIN_PASSWORD=change-me-to-a-secure-password
PAPERLESS_ADMIN_MAIL=admin@fzymgc.house

# Consumer settings
PAPERLESS_CONSUMER_RECURSIVE=true
PAPERLESS_CONSUMER_SUBDIRS_AS_TAGS=true
PAPERLESS_FILENAME_DATE_ORDER=YMD
PAPERLESS_TASK_WORKERS=2
PAPERLESS_LOGGING_DIR=/usr/src/paperless/data/log
```

2. **Create required directories**:
```bash
sudo mkdir -p /mnt/paperless-data/{data/paperless,data/postgres,data/valkey,storage/media,export,ingestion}
sudo chown -R 1000:1000 /mnt/data/nas-container-apps/paperless-ngx/
```

3. **Start the services**:
```bash
docker compose up -d
```

## Access

- **Web Interface**: https://paperless.fzymgc.house
- **Default Login**: admin / (password set in .env file)

## Document Processing

- **Consume Directory**: `/mnt/paperless-data/ingestion`
  - Drop documents here for automatic processing
- **Export Directory**: `/mnt/paperless-data/export`
  - Exported documents appear here

## Features Enabled

- **Tika Integration**: Enhanced text extraction from various document formats
- **Gotenberg Integration**: PDF generation and conversion
- **OCR**: Optical Character Recognition for scanned documents
- **Valkey Integration**: Redis-compatible caching and task queuing
- **Traefik Integration**: HTTPS termination and routing
- **Authentik Integration**: SSO authentication

## Notes

- Make sure to change all default passwords in the .env file
- The service is configured to use Authentik for authentication
- All data is persisted to `/mnt/paperless-data/`
- Uses PostgreSQL 17 for improved performance and features
- Valkey provides Redis-compatible caching with enhanced reliability
- The service runs on both main and internal networks for proper Traefik routing
