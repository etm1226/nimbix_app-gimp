FROM nimbix/centos-desktop:7

ADD NAE/AppDef.json /etc/NAE/AppDef.json

RUN yum clean all && yum -y install gimp

RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate

# Expose port 22 for local JARVICE emulation in docker
EXPOSE 22

# for standalone use
EXPOSE 5901
EXPOSE 443
