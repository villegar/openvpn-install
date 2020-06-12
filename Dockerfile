FROM ubuntu:18.04
LABEL maintainer="Roberto Villegas-Diaz <bthillo@gmail.com>"

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get clean

COPY ./run.sh /opt/src/openvpn-install.sh
RUN chmod 755 /opt/src/openvpn-install.sh

ARG PORT=1194
EXPOSE $PORT/udp

CMD ["/opt/src/openvpn-install.sh"]
