FROM vixns/java8
MAINTAINER Stéphane Cottin <stephane.cottin@vixns.com>

ENV RIEMANN_VERSION 0.2.11-20150824-040014

RUN curl -L -k -s -O https://apt.vixns.net/riemann/riemann_${RIEMANN_VERSION}_all.deb
RUN dpkg -i riemann_${RIEMANN_VERSION}_all.deb && rm riemann_${RIEMANN_VERSION}_all.deb

RUN mkdir /etc/riemann/config
COPY riemann.config /etc/riemann/riemann.config
COPY default.config /etc/riemann/config/99-default.config
COPY riemann.sh /usr/local/bin/riemann.sh

EXPOSE 5555
EXPOSE 5555/udp
EXPOSE 5556

ENTRYPOINT ["/usr/local/bin/riemann.sh"]