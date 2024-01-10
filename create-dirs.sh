#!/bin/bash

# Directories to create
dirs=(
  "/srv/AppData/Nextcloud/config"
  "/srv/AppData/Nextcloud/storage"
  "/srv/AppData/Openvscode/data"
  "/srv/AppData/Bazarr"
  "/srv/AppData/Sonarr"
  "/srv/AppData/Qbittorrent"
  "/srv/AppData/Radarr"
  "/srv/AppData/Prowlarr"
  "/srv/AppData/Jellyseer"
  "/srv/AppData/Homepage/config"
  "/srv/AppData/Cloudflare"
  "/srv/AppData/Speedtest-Tracker"
  "/srv/AppData/Vaultwarden"
  "/srv/AppData/Yarr"
  "/srv/AppData/Glances"
  "/srv/AppData/N8n"
  "/srv/AppData/Flaresolverr/config"
  "/srv/AppData/Mealie"
  "/srv/AppData/Unmanic/config"
  "/srv/AppData/Unmanic/cache"
  "/srv/TV"
  "/srv/Movies"
)

# Create directories
mkdir -p "${dirs[@]}"
