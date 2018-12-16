ARG BUILD_FROM=hassioaddons/base:2.3.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set environment locale
ENV LANG en_US.utf8

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
# hadolint ignore=DL3003
RUN \
    apk add --no-cache --virtual .build-dependencies \
        autoconf=2.69-r2 \
        bzip2-dev=1.0.6-r6 \
        curl-dev=7.61.1-r1 \
        g++=6.4.0-r9 \
        gcc=6.4.0-r9 \
        libsass-dev=3.5.4-r0 \
        libxml2-dev=2.9.8-r1 \
        libxslt-dev=1.1.32-r0 \
        make=4.2.1-r2 \
        mariadb-dev=10.2.15-r0 \
        postgresql-dev=10.5-r0 \
        zlib-dev=1.2.11-r1 \
    \
    && apk add --no-cache \
        apache2-utils=2.4.35-r0 \
        bzip2=1.0.6-r6 \
        git=2.18.1-r0 \
        libsass=3.5.4-r0 \
        libxml2=2.9.8-r1 \
        libxslt=1.1.32-r0 \
        nginx=1.14.2-r0 \
        nodejs=8.14.0-r0 \
        postgresql-contrib=10.5-r0 \
        postgresql=10.5-r0 \
        ruby-bigdecimal@edge=2.5.3-r1 \
        ruby-bundler@edge=1.16.2-r1 \
        ruby-dev@edge=2.5.3-r1 \
        ruby-etc@edge=2.5.3-r1 \
        ruby-json@edge=2.5.3-r1 \
        ruby-rdoc@edge=2.5.3-r1 \
        ruby@edge=2.5.3-r1 \
        zlib=1.2.11-r1 \
    \
    && git clone --branch 0fa9216 --depth=1 \
        https://github.com/octobox/octobox.git /opt \
    \
    && cd /opt \
    && bundle install \
        --without test \
        production \
        --jobs 2 \
    \
    && mkdir -p /var/run/postgresql \
    \
    && addgroup octobox \
    && adduser -D -H -S -G octobox octobox \
    \
    && apk del --purge \
        .build-dependencies \
        ruby-dev

# Copy root filesystem
COPY rootfs /

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Octobox" \
    io.hass.description="Take back control of your GitHub notifications" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.label-schema.description="Take back control of your GitHub notifications" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Octobox" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://community.home-assistant.io/t/community-hass-io-add-on-octobox/57695?u=frenck" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-octobox/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-octobox" \
    org.label-schema.vendor="Community Hass.io Add-ons"
