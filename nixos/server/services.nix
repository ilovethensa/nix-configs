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
      environment = [
        "TZ=Europe/Sofia"
      ]
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
  };
}
