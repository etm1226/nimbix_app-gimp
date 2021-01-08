FROM centos:7
LABEL maintainer="Nimbix, Inc." \
      license="BSD"

WORKDIR /tmp

# Install image-common for X, VNC and common utilities
RUN curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/image-common/master/install-nimbix.sh \
        | bash -s -- --setup-nimbix-desktop

RUN yum install -y gimp

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate
