#!/bin/bash

#Restore script should be done with wsl or in a linux environment with bash

# nginx
docker run --rm --volumes-from nginx -v ./backup:/backup ubuntu bash -c "cd /data && tar xvf /backup/nginx_data.tar"
docker run --rm --volumes-from nginx -v ./backup:/backup ubuntu bash -c "cd /etc/letsencrypt && tar xvf /backup/letsencrypt.tar"

# derbynet
docker run --rm --volumes-from derbynet -v ./backup:/backup ubuntu bash -c "cd /var/lib/derbynet && tar xvf /backup/derbynet.tar"

# jellyfin
docker run --rm --volumes-from jellyfin -v ./backup:/backup ubuntu bash -c "cd /config && tar xvf /backup/jellyfin_data.tar"
docker run --rm --volumes-from jellyfin -v ./backup:/backup ubuntu bash -c "cd /cache && tar xvf /backup/jellyfin_cache.tar"

#plex
docker run --rm --volumes-from plex -v ./backup:/backup ubuntu bash -c "cd /config && tar xvf /backup/plex_data.tar"

# vpn
docker run --rm --volumes-from vpn -v ./backup:/backup ubuntu bash -c "cd /config && tar xvf /backup/gluetun_data.tar"

# prowlarr
docker run --rm --volumes-from prowlarr -v ./backup:/backup ubuntu bash -c "cd /config && tar xvf /backup/prowlarr_data.tar"

# radarr
docker run --rm --volumes-from radarr -v ./backup:/backup ubuntu bash -c "cd /config && tar xvf /backup/radarr_data.tar"

# sonarr
docker run --rm --volumes-from sonarr -v ./backup:/backup ubuntu bash -c "cd /config && tar xvf /backup/sonarr_data.tar"

# qbittorrent
docker run --rm --volumes-from qbittorrent -v ./backup:/backup ubuntu bash -c "cd /config && tar xvf /backup/qbittorrent_data.tar"