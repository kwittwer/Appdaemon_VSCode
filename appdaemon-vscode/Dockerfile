ARG BUILD_FROM=ghcr.io/hassio-addons/base:17.2.4
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Versions
ARG CODE_SERVER_VERSION="4.93.1"

# Copy Python requirements file
COPY requirements.txt /tmp/

# Setup runtime dependencies, Python packages and code-server
# hadolint ignore=DL3003
RUN \
    apk add --no-cache \
        python3 \
        py3-pip \
        py3-wheel \
        nodejs \
        npm \
        libstdc++ \
    \
    && pip install --no-cache-dir --break-system-packages -r /tmp/requirements.txt \
    \
    && FORCE_NODE_VERSION=1 npm install --global "code-server@${CODE_SERVER_VERSION}" \
    && npm cache clean --force \
    \
    && find /usr \
        \( -type d -a -name test -o -name tests -o -name '__pycache__' \) \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
        -exec rm -rf '{}' +

# Copy root filesystem
COPY rootfs /

# Ensure s6 service scripts are executable (Windows git checkouts may lose +x)
RUN \
    chmod +x /etc/s6-overlay/s6-rc.d/init-appdaemon/run \
    && chmod +x /etc/s6-overlay/s6-rc.d/appdaemon/run \
    && chmod +x /etc/s6-overlay/s6-rc.d/code-server/run

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="app" \
    io.hass.version=${BUILD_VERSION} \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
