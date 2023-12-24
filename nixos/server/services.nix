# configuration.nix

{ config, pkgs, ... }:

{
  virtualisation.oci-containers.containers.filebrowser = {
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
}
