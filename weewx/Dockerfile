ARG BUILD_FROM=hassioaddons/base:4.0.2
FROM ${BUILD_FROM}

# Install packages.
RUN apk add --no-cache python2 python2-dev py2-pip
RUN apk add \
    --no-cache \
    --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    --allow-untrusted \
    py-imaging py2-six py2-configobj py2-cheetah py2-serial py2-usb \
    libusb aws-cli s3cmd
RUN wget http://weewx.com/downloads/weewx-3.9.2.tar.gz && \
    tar xvfz weewx-3.9.2.tar.gz && \
    cd weewx-3.9.2 && \
    ./setup.py build && \
    ./setup.py install --no-prompt
RUN wget https://github.com/jesterpm/weewx-S3upload/archive/master.zip && \
    unzip master.zip && \
    mkdir -p /home/weewx/bin/user && \
    cp weewx-S3upload-master/bin/user/S3upload.py /home/weewx/bin/user


# Copy root filesystem.
COPY rootfs /

# Script to run after startup.
CMD ["/usr/bin/run.sh"]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="WeeWX" \
    io.hass.description="WeeWX Weather Station" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Jesse Morgan <jesse@jesterpm.net>" \
    org.label-schema.description="WeeWX Weather Station" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="WeeWX" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/jesterpm/weewx-hassio-addon" \
    org.label-schema.usage="https://github.com/jesterpm/weewx-hassio-addon/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/jesterpm/weewx-hassio-addon"
