#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
mkdir -p backups
ts=$(date +%Y%m%d-%H%M%S)
docker compose exec -T postgres sh -c 'pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB"' | gzip > "backups/db-$ts.sql.gz"
echo "Wrote backups/db-$ts.sql.gz"