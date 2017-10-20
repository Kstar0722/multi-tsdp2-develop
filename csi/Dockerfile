FROM multiarch/alpine:x86-v3.6

ENV DISPLAY :1

COPY ./bin/s6-overlay-amd64.tar.gz /tmp/s6-overlay-amd64.tar.gz

RUN tar xvfz /tmp/s6-overlay-amd64.tar.gz -C / \
    && rm -f /tmp/s6-overlay-amd64.tar.gz \
    && echo "@edge http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "@testing http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache --update \
      bash \
      ca-certificates \
      dbus-x11 \
      gnutls-dev \
      openbox \
      samba-winbind-clients \
      wine@edge \
      x11vnc@testing \
      xvfb \
      zlib \
    && echo 'exec openbox-session' > /root/.xinitrc

COPY ./etc/services.d /etc/services.d

COPY ./etc/xdg/openbox/menu.xml /etc/xdg/openbox/menu.xml

ENTRYPOINT ["/init"]

WORKDIR /root

COPY ./home/ /root/

EXPOSE 5900

CMD ["dbus-launch", "wine", "C:\\UA\\CSiUA.exe"]
