# configuration.nix

{ config, pkgs, ... }:

{
  virtualisation.oci-containers.containers = {
    filebrowser = {
      image = "docker://filebrowser/filebrowser";
      volumes = [
        "/portainer:/srv"
        "/data/AppData/filebrowser/config/database.db:/database.db"
      ];
      ports = [ 
        "1010:80" 
      ];
      autoStart = true;
    };
    bazarr = {
      image = "docker://lscr.io/linuxserver/bazarr:1.4.0";
      volumes = [
        "/data/AppData/Bazarr:/config"
        "/portainer/Movies:/movies"
        "/portainer/TV:/tv"
      ];
      ports = [ 
        "6767:6767" 
      ];
      autoStart = true;
    };
    sonarr = {
      image = "docker://lscr.io/linuxserver/sonarr:3.0.10";
      volumes = [
        "/data/AppData/Sonarr:/config"
        "/portainer/Downloads:/downloads"
        "/portainer/TV:/tv"
      ];
      ports = [ 
        "8989:8989" 
      ];
      autoStart = true;
    };
    transmission = {
      image = "docker://lscr.io/linuxserver/transmission:4.0.5";
      volumes = [
        "/data/AppData/Transmission:/config"
        "/portainer/Downloads:/downloads"
        "/portainer/TV:/tv"
        "/portainer/Movies:/movies"
      ];
      ports = [ 
        "9091:9091"
        "51413:51413"
        "51413:51413/udp"
      ];
      autoStart = true;
    };
    radarr = {
      image = "docker://lscr.io/linuxserver/radarr:latest";
      volumes = [
        "/data/AppData/Sonarr:/config"
        "/portainer/Downloads:/downloads"
        "/portainer/Movies:/movies"
      ];
      ports = [ 
        "7878:7878" 
      ];
      autoStart = true;
    };
  };
}