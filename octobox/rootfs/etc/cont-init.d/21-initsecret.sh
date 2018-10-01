#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Octobox
# Initialize Postgres database
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

# If directory exists, skip this script
if hass.file_exists "/data/secret"; then
    exit 0
fi

# Use a part of the Hassio token as a secret
echo "${HASSIO_TOKEN:21:32}" > /data/secret
