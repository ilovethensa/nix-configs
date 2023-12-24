# configuration.nix

{ config, pkgs, ... }:

{
  virtualisation.oci-containers.containers.filebrowser = {
    image = "docker://filebrowser/filebrowser";
    volumes = [
      "/portainer:/srv"
      "filebrowser_db:/database.db"
    ];
    user = {
      uid = config.users.users.tht.uid;
      gid = config.users.users.tht.gid;
    };
    ports = { "1010" = "80"; };
  };

  virtualisation.oci-containers.volumes.filebrowser_db = {};
}
