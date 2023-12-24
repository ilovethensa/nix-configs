# configuration.nix

{ config, pkgs, ... }:

{
  virtualisation.oci-containers.containers.filebrowser = {
    image = "docker://filebrowser/filebrowser";
    volumes = [
      "/portainer:/srv"
      "filebrowser_db:/database.db"
    ];
    ports = [ 
      "1010:80" 
    ];
  };
}
