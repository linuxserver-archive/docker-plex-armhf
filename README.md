[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# lsioarmhf/plex
[![](https://images.microbadger.com/badges/image/lsioarmhf/plex.svg)](https://microbadger.com/images/lsioarmhf/plex "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/lsioarmhf/plex.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/lsioarmhf/plex.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io-armhf/lsioarmhf-plex)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io-armhf/job/lsioarmhf-plex/)
[hub]: https://hub.docker.com/r/lsioarmhf/plex/

[Plex](https://plex.tv/) organizes video, music and photos from personal media libraries and streams them to smart TVs, streaming boxes and mobile devices. This container is packaged as a standalone Plex Media Server.

[![plex](http://the-gadgeteer.com/wp-content/uploads/2015/10/plex-logo-e1446990678679.png)][plexurl]
[plexurl]: https://plex.tv

## Usage

```
docker create \
	--name=plex \
	--net=host \
	-e PUID=<UID> -e PGID=<GID> \
	-v </path/to/library>:/config \
	-v <path/to/tvseries>:/data/tvshows \
	-v </path/to/movies>:/data/movies \
	-v </path for transcoding>:/transcode \
	lsioarmhf/plex
```

**Parameters**

* `--net=host` - Shares host networking with container, **required**.
* `-v /config` - Plex library location. *This can grow very large.*
* `-v /data/xyz` - Media goes here. Add as many as needed e.g. `/data/movies`, `/data/tv`, etc.
* `-v /transcode` - Path for transcoding folder, *optional*.
* `-e PGID=` for for GroupID - see below for explanation
* `-e PUID=` for for UserID - see below for explanation

It is based on ubuntu xenial with s6 overlay, for shell access whilst the container is running do `docker exec -it plex /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" <sup>TM</sup>.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 
`IMPORTANT... THIS IS THE ARMHF VERSION`

Webui can be found at `<your-ip>:32400/web`


## Info

* Shell access whilst the container is running: `docker exec -it plex /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f plex`

## Versions

+ **22.09.16:** Initial Release.
