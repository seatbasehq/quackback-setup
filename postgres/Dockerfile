FROM postgres:17

# Quackback needs pgvector (embeddings) and pg_cron
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-17-pgvector \
        postgresql-17-cron \
    && rm -rf /var/lib/apt/lists/*

# cron.database_name must match POSTGRES_DB (default: quackback)
CMD ["postgres", "-c", "shared_preload_libraries=pg_cron", "-c", "cron.database_name=quackback"]