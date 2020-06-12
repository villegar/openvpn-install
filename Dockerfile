FROM ubuntu:18.04
LABEL maintainer="Roberto Villegas-Diaz <bthillo@gmail.com>"

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get clean
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openvpn openssl ca-certificates iptables curl

COPY ./run.sh /opt/src/openvpn-install.sh
RUN chmod 755 /opt/src/openvpn-install.sh

ARG OVPN_CLIENT=villegar
ARG OVPN_IP=127.0.0.1
ARG OVPN_PORT=1194
ARG OVPN_PROTOCOL=udp

ENV OVPN_CLIENT=$OVPN_CLIENT
ENV OVPN_IP=$OVPN_IP
ENV OVPN_PORT=$OVPN_PORT
ENV OVPN_PROTOCOL=$OVPN_PROTOCOL

EXPOSE $OVPN_PORT/udp

CMD ["/opt/src/openvpn-install.sh"]
