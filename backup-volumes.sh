#!/bin/bash

# Change to the docker folder
cd /mnt/c/Users/Blake/OneDrive/Documents/Docker/Faraday

# pull down any updates for each of the containers
powershell.exe docker compose pull

# start up the containers
powershell.exe docker compose up -d

# stop to containers, do not down them so there is still access to the volumes
powershell.exe docker compose stop

# nginx
docker run --rm --volumes-from nginx -v ./backup:/backup ubuntu tar cvf /backup/nginx_data.tar -C /data .
docker run --rm --volumes-from nginx -v ./backup:/backup ubuntu tar cvf /backup/letsencrypt.tar -C /etc/letsencrypt .

# faraday_derbynet_data
docker run --rm --volumes-from derbynet -v ./backup:/backup ubuntu tar cvf /backup/derbynet_data.tar -C /var/lib/derbynet .

# Jellyfin
# docker run --rm --volumes-from jellyfin -v ./backup:/backup ubuntu tar cvf /backup/jellyfin_data.tar -C /config .
# docker run --rm --volumes-from jellyfin -v ./backup:/backup ubuntu tar cvf /backup/jellyfin_cache.tar -C /cache .

# Plex
# docker run --rm --volumes-from plex -v ./backup:/backup ubuntu tar cvf /backup/plex_data.tar -C /config .

# vpn
docker run --rm --volumes-from vpn -v ./backup:/backup ubuntu tar cvf /backup/gluetun_data.tar -C /gluetun .

# Prowlarr
docker run --rm --volumes-from prowlarr -v ./backup:/backup ubuntu tar cvf /backup/prowlarr_data.tar -C /config .

# radarr
docker run --rm --volumes-from radarr -v ./backup:/backup ubuntu tar cvf /backup/radarr_data.tar -C /config .

# sonarr
docker run --rm --volumes-from sonarr -v ./backup:/backup ubuntu tar cvf /backup/sonarr_data.tar -C /config .

# qbittorrent
docker run --rm --volumes-from qbittorrent -v ./backup:/backup ubuntu tar cvf /backup/qbittorrent_data.tar -C /config .

# Start it all back up using the powershell script
powershell.exe docker compose up -d