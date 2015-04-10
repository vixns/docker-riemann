FROM vixns/java8
MAINTAINER Stéphane Cottin <stephane.cottin@vixns.com>

ENV RIEMANN_VERSION 0.2.9

RUN curl -L -k -s -O https://aphyr.com/riemann/riemann_${RIEMANN_VERSION}_all.deb
RUN dpkg -i riemann_${RIEMANN_VERSION}_all.deb

RUN mkdir /etc/riemann/config
ADD riemann.config /etc/riemann/riemann.config
ADD default.config /etc/riemann/config/99-default.config
ADD riemann.sh /usr/local/bin/riemann.sh

EXPOSE 5555
EXPOSE 5555/udp
EXPOSE 5556

ENTRYPOINT ["/usr/local/bin/riemann.sh"]