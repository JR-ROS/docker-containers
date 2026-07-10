FROM ghcr.io/jr-ros/jr_bot_common:aarch64-v1.1.1

ENV PLATFORM=sbc

USER root

## Update system
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update -y

## install hardware-specific packages
RUN apt-get install --no-install-recommends -y \
    python3-lgpio \
    python3-gpiozero \
    python3-smbus \
    i2c-tools

USER ubuntu
WORKDIR $WORKSPACE

LABEL org.opencontainers.image.authors="eccentricOrange"
LABEL org.opencontainers.image.source="https://github.com/JR-ROS/docker-containers"
