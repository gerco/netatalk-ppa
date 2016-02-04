FROM ubuntu:15.10

MAINTAINER Gerco Dries <gerco@gdries.nl>

RUN apt-get update

#RUN apt-get install -y build-essential libevent-dev libssl-dev libgcrypt-dev libkrb5-dev libpam0g-dev libwrap0-dev libdb-dev libtdb-dev libmysqlclient-dev avahi-daemon libavahi-client-dev libacl1-dev libldap2-dev libcrack2-dev systemtap-sdt-dev libdbus-1-dev libdbus-glib-1-dev libglib2.0-dev tracker libtracker-sparql-1.0-dev libtracker-miner-1.0-dev

RUN apt-get install -y packaging-dev dh-make
RUN apt-get install -y equivs

RUN mkdir /src
COPY netatalk_3.1.8.orig.tar.bz2 /src/
ADD netatalk_3.1.8.orig.tar.bz2 /src/
ADD debian src/netatalk-3.1.8/debian
ADD build-and-upload.sh /root/

WORKDIR /src/netatalk-3.1.8
RUN DEBIAN_FRONTEND=noninteractive mk-build-deps -i -r -t "apt-get -qq --no-install-recommends"

CMD /root/build-and-upload.sh

