FROM lsiobase/xenial.armhf
MAINTAINER sparklyballs

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME="/config"

# install packages
RUN \
 apt-get update && \
 apt-get install -y \
	apt-transport-https \
	wget && \
 wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | apt-key add - && \
 echo "deb https://dev2day.de/pms/ jessie main" >> /etc/apt/sources.list.d/plex.list && \
 apt-get update && \
 apt-get install -y \
	avahi-daemon \
	dbus \
	plexmediaserver-installer && \

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp
VOLUME /config
