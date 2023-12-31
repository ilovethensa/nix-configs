# configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    ./jellyfin.nix
  ];

  # Enable docker socket for homepage docker integration
  virtualisation.podman.dockerSocket.enable = true;
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "server";
    config.adminpassFile = "/srv/AppData/Nextcloud/config/pass";
    extraOptions.trusted_domains = [
        "192.168.1.100"
        "server.tail8383e.ts.net"
        "100.108.163.105"
        "cloud.theholytachanka.com"
    ];
    home = "/srv/AppData/Nextcloud/storage";
    configureRedis = true;
  };
  services.nginx.virtualHosts."server".listen = [ { addr = "0.0.0.0"; port = 6245; } ];

  services.openvscode-server = {
    enable = true;
    telemetryLevel = "off";
    serverDataDir = "/srv/AppData/Openvscode/data";
    host = "0.0.0.0";
    #connectionTokenFile = "/srv/AppData/Openvscode/token";
    withoutConnectionToken = true;
    extraPackages = with pkgs; [
      git
    ];
  };

  virtualisation.oci-containers.containers = {
    bazarr = {
      image = "docker://lscr.io/linuxserver/bazarr:latest";
      volumes = [
        "/srv/AppData/Bazarr:/config"
        "/srv/Movies:/movies"
        "/srv/TV:/tv"
      ];
      ports = [ 
        "6767:6767" 
      ];
      autoStart = true;
    };
    sonarr = {
      image = "docker://lscr.io/linuxserver/sonarr:latest";
      volumes = [
        "/srv/AppData/Sonarr:/config"
        "/srv/Downloads:/downloads"
        "/srv/TV:/tv"
      ];
      ports = [ 
        "8989:8989" 
      ];
      autoStart = true;
    };
    qbittorrent = {
      image = "docker://lscr.io/linuxserver/qbittorrent:latest";
      volumes = [
        "/srv/AppData/Qbittorrent:/config"
        "/srv/Downloads:/downloads"
        "/srv/TV:/tv"
        "/srv/Movies:/movies"
      ];
      ports = [ 
        "7654:7654"
        "13098:13098"
        "13098:13098/udp"
      ];
      environment = {
        WEBUI_PORT = "7654";
      };
      autoStart = true;
    };
    radarr = {
      image = "docker://lscr.io/linuxserver/radarr:latest";
      volumes = [
        "/srv/AppData/Radarr:/config"
        "/srv/Downloads:/downloads"
        "/srv/Movies:/movies"
      ];
      ports = [ 
        "7878:7878" 
      ];
      autoStart = true;
    };
    prowlarr = {
      image = "docker://lscr.io/linuxserver/prowlarr:latest";
      volumes = [
        "/srv/AppData/Prowlarr:/config"
      ];
      ports = [ 
        "9696:9696" 
      ];
      autoStart = true;
    };
    jellyseerr = {
      image = "docker://fallenbagel/jellyseerr:latest";
      volumes = [
        "/srv/AppData/Jellyseer:/app/config"
      ];
      ports = [ 
        "5055:5055" 
      ];
      autoStart = true;
    };
    homepage = {
      image = "docker://ghcr.io/gethomepage/homepage:v0.8.4";
      volumes = [
        "/srv/AppData/Homepage/config:/app/config"
        "/srv:/srv"
        "/run/podman/podman.sock:/var/run/docker.sock"
      ];
      ports = [ 
        "80:3000"
      ];
      autoStart = true;
    };
    cloudflared-web = {
      image = "docker://wisdomsky/cloudflared-web:latest";
      volumes = [
        "/srv/AppData/Cloudflare:/config"
      ];
      extraOptions = [
        "--network=host"
      ];
      autoStart = true;
    };
  speedtest-tracker = {
    image = "ghcr.io/alexjustesen/speedtest-tracker:latest";
    hostname = "speedtest-tracker";
    ports = [ "8080:80" "8443:443" ];
    environment = {
      PUID = "1000";
      PGID = "1000";
      DB_CONNECTION = "pgsql";
      DB_HOST = "192.168.1.100";
      DB_PORT = "5432";
      DB_DATABASE = "speedtest_tracker";
      DB_USERNAME = "speedy";
      DB_PASSWORD = "password";
    };
    volumes = [
      "speedtest-app:/config"
    ];
    autoStart = true;
    dependsOn = [ "db" ];
  };

    db = {
      image = "postgres:15";
      hostname = "db";
      autoStart = true;
      environment = {
        POSTGRES_DB = "speedtest_tracker";
        POSTGRES_USER = "speedy";
        POSTGRES_PASSWORD = "password";
      };
      volumes = [
        "speedtest-db:/var/lib/mysql"
      ];
      ports = [
        "5432:5432"
      ];
    };

    vaultwarden = {
      image = "docker://vaultwarden/server:latest";
      volumes = [
        "/srv/AppData/Vaultwarden:/data"
      ];
      
      ports = [ 
        "2456:80" 
      ];
      autoStart = true;
    };

    yarr = {
      image = "docker://ghcr.io/wakeful-cloud/yarr:latest";
      volumes = [
        "/srv/AppData/Yarr:/data"
      ];
      
      ports = [ 
        "6060:7070" 
      ];
      autoStart = true;
    };


    glances = {
      image = "docker://nicolargo/glances:latest-full";
      extraOptions = [
        "--network=host"
        "--pid"
        "host"
        "--privileged"
      ];
      environment = {
        GLANCES_OPT = "-w";
      };
      volumes = [
        "/var/run/docker.sock:/var/run/docker.sock:ro"
        "/srv:/hostfs:ro"
      ];
      autoStart = true;
    };

    n8n = {
      image = "docker://docker.n8n.io/n8nio/n8n";
      ports = [
        "5678:5678"
      ];
      volumes = [
        "/srv/AppData/N8n:/home/node/.n8n"
      ];
      environment = {
        WEBHOOK_URL = "https://wbhk.theholytachanka.com";
      };
      autoStart = true;
    };

    flaresolverr = {
      image = "docker://ghcr.io/flaresolverr/flaresolverr:latest";
      ports = [
        "8191:8191"
      ];
      autoStart = true;
    };

    mealie = {
      image = "docker://ghcr.io/mealie-recipes/mealie:v1.0.0-RC1.1";
      volumes = [
      "/srv/AppData/Mealie:/app/data/"
      ];
      ports = [
        "9925:9000"
      ];
      environment = {
        ALLOW_SIGNUP = "true";
        MAX_WORKERS = "1";
        WEB_CONCURRENCY = "1";
      };
      autoStart = true;
    };

    unmanic = {
      image = "docker://josh5/unmanic:latest";
      extraOptions = [
        "--device=/dev/dri"
      ];
      volumes = [
      "/srv/AppData/Unmanic/config:/config"
      "/srv/AppData/Unmanic/cache:/tmp/unmanic"
      "/srv/TV:/library/TV"
      "/srv/Movies:/library/Movies"
      ];
      ports = [
        "8888:8888"
      ];
      autoStart = true;
    };

  };


}
