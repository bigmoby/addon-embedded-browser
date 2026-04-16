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
        openbox \
        tigervnc-common \
        tigervnc-standalone-server \
        websockify \
        wmctrl \
        xdotool \
        xfonts-base \
        xfonts-scalable \
        tigervnc-tools \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://github.com/novnc/noVNC/archive/refs/tags/v1.6.0.tar.gz \
       | tar -xz -C /opt \
    && ln -s /opt/noVNC-1.6.0 /opt/novnc \
    && ln -s /opt/novnc/vnc.html /opt/novnc/index.html

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