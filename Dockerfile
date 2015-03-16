FROM resin/rpi-raspbian:wheezy-2015-01-15

RUN apt-get update && apt-get install -y \
    matchbox \
    chromium \
    x11-xserver-utils \
    ttf-mscorefonts-installer \
    xwit \
    fbset \
    sqlite3 \
    libnss3 \
    xinit \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./config.txt /boot/config.txt
COPY ./rc.local /etc/rc.local
COPY ./xinitrc /root/.xinitrc
COPY ./startx.sh /root/startx.sh

ENTRYPOINT /root/startx.sh
