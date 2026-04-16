ARG BUILD_FROM=scratch
# hadolint ignore=DL3006
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        dbus-x11 \
        epiphany-browser \
        iproute2 \
        netcat-openbsd \
        nginx \
        novnc \
        openbox \
        tigervnc-common \
        tigervnc-standalone-server \
        wmctrl \
        xdotool \
        xfonts-base \
        xfonts-scalable \
    && rm -rf /var/lib/apt/lists/*

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Embedded browser" \
    io.hass.description="Embedded browser inner Home Assistant environment" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Fabio Bigmoby Mauro <https://github.com/bigmoby>" \
    org.opencontainers.image.title="Embedded browser" \
    org.opencontainers.image.description="Embedded browser inner Home Assistant environment" \
    org.opencontainers.image.vendor="Home Assistant Bigmoby Add-ons" \
    org.opencontainers.image.authors="Fabio Bigmoby Mauro <https://github.com/bigmoby>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/bigmoby/addon-embedded-browser" \
    org.opencontainers.image.documentation="https://github.com/bigmoby/addon-embedded-browser/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
