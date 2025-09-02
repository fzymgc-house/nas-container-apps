#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER paperless WITH PASSWORD 'paperless';
	CREATE DATABASE paperless WITH OWNER paperless;
	GRANT ALL PRIVILEGES ON DATABASE paperless TO paperless;
EOSQL
