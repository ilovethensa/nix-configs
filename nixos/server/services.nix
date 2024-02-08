# configuration.nix

{ config, pkgs, ... }:

{
  imports = [ ./jellyfin.nix ];

  # Enable docker socket for homepage docker integration
  virtualisation.podman.dockerSocket.enable = true;

  virtualisation.oci-containers.containers = {
    homepage = {
      image = "docker://ghcr.io/gethomepage/homepage:v0.8.4";
      volumes = [
        "/srv/AppData/Homepage/config:/app/config"
        "/srv:/srv"
        "/run/podman/podman.sock:/var/run/docker.sock"
      ];
      ports = [ "80:3000" ];
      autoStart = true;
    };
    cloudflared-web = {
      image = "docker://wisdomsky/cloudflared-web:latest";
      volumes = [ "/srv/AppData/Cloudflare:/config" ];
      extraOptions = [ "--network=host" ];
      autoStart = true;
    };
    glances = {
      image = "docker://nicolargo/glances:latest-full";
      extraOptions = [ "--network=host" "--pid" "host" "--privileged" ];
      environment = { GLANCES_OPT = "-w"; };
      volumes =
        [ "/var/run/docker.sock:/var/run/docker.sock:ro" "/srv:/hostfs:ro" ];
      autoStart = true;
    };

    n8n = {
      image = "docker://docker.n8n.io/n8nio/n8n";
      ports = [ "5678:5678" ];
      volumes = [ "/srv/AppData/N8n:/home/node/.n8n" ];
      environment = { WEBHOOK_URL = "https://wbhk.theholytachanka.com"; };
      autoStart = true;
    };

    crafty = {
      image = "docker://registry.gitlab.com/crafty-controller/crafty-4:latest";
      volumes = [
        "/srv/AppData/Crafty/backups:/crafty/backups"
        "/srv/AppData/Crafty/logs:/crafty/logs"
        "/srv/AppData/Crafty/servers:/crafty/servers"
        "/srv/AppData/Crafty/config:/crafty/app/config"
        "/srv/AppData/Crafty/import:/crafty/import"
      ];
      ports = [
        "8000:8000"
        "8443:8443"
        "8123:8123"
        "19132:19132/udp"
        "25500-25600:25500-25600"
      ];
      autoStart = true;
    };
    miniflux = {
      image = "docker://miniflux/miniflux:latest";
      environment = {
        DATABASE_URL = "postgres://miniflux:secret@db/miniflux?sslmode=disable";
        RUN_MIGRATIONS = "1";
        CREATE_ADMIN = "0";
        ADMIN_USERNAME = "admin";
        ADMIN_PASSWORD = "test123";
        FETCH_YOUTUBE_WATCH_TIME = "1";
        BASE_URL = "rss.theholytachanka.com";
        INVIDIOUS_INSTANCE = "yt.theholytachanka.com";
      };
      ports = [ "6554:8080" ];
      autoStart = true;
      dependsOn = [ "db" ];
    };

    db = {
      image = "docker://postgres:15";
      volumes = [ "/srv/AppData/Miniflux/db:/var/lib/postgresql/data" ];
      environment = {
        POSTGRES_USER = "miniflux";
        POSTGRES_PASSWORD = "secret";
        POSTGRES_DB = "miniflux";
      };
      autoStart = true;
    };
  };

}
