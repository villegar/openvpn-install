FROM ubuntu:18.04
LABEL maintainer="Roberto Villegas-Diaz <bthillo@gmail.com>"

RUN apt-get update && \
    apt-get upgrade && \
    apt-get clean

COPY ./run.sh /opt/src/openvpn-install.sh
RUN chmod 755 /opt/src/openvpn-install.sh

EXPOSE 20000/udp

CMD ["/opt/src/openvpn-install.sh"]
