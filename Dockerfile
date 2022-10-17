FROM ubuntu:jammy
LABEL maintainer="Nimbix, Inc." \
      license="BSD"

WORKDIR /tmp

# Add jarvice-desktop for Desktop support, FFmpeg and codecs
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install ca-certificates curl gimp --no-install-recommends && \
    curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/jarvice-desktop/master/install-nimbix.sh \
        | bash

COPY NAE/AppDef.json /etc/NAE/AppDef.json
#RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate
