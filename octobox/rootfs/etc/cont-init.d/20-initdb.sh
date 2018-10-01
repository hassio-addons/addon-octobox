#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Octobox
# Initialize Postgres database
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

export PGDATA=/data/postgres

# If directory exists, skip this script
if hass.directory_exists "${PGDATA}"; then
    exit 0
fi

# Create PG_DATA location
mkdir -p "${PGDATA}"
chown postgres:postgres "${PGDATA}"
chmod 0700 "${PGDATA}"

# Init database
s6-setuidgid postgres initdb --username=postgres

# Internal start of server in order to allow set-up using psql-client
# does not listen on external TCP/IP and waits until start finishes
s6-setuidgid postgres pg_ctl -D "$PGDATA" \
    -o "-c listen_addresses=''" \
    -w start

# Create Octobox database
s6-setuidgid postgres psql -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
    CREATE DATABASE octobox ;
EOSQL

# Stop server
s6-setuidgid postgres pg_ctl -D "${PGDATA}" -m fast -w stop
