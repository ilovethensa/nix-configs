# configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    ./jellyfin.nix
  ];

  # Enable docker socket for homepage docker integration
  virtualisation.podman.dockerSocket.enable = true;

  # Enable monitoring
  services.netdata = {
    enable = true;

	 package = pkgs.netdata.override {
 		withCloud = true;
 	 };
  };

  virtualisation.oci-containers.containers = {
    filebrowser = {
      image = "docker://filebrowser/filebrowser";
      volumes = [
        "/data:/srv"
        "/data/AppData/filebrowser/config/database.db:/database.db"
      ];
      ports = [ 
        "1010:80" 
      ];
      autoStart = true;
    };
    bazarr = {
      image = "docker://lscr.io/linuxserver/bazarr:latest";
      volumes = [
        "/data/AppData/Bazarr:/config"
        "/data/Movies:/movies"
        "/data/TV:/tv"
      ];
      ports = [ 
        "6767:6767" 
      ];
      autoStart = true;
    };
    sonarr = {
      image = "docker://lscr.io/linuxserver/sonarr:latest";
      volumes = [
        "/data/AppData/Sonarr:/config"
        "/data/Downloads:/downloads"
        "/data/TV:/tv"
      ];
      ports = [ 
        "8989:8989" 
      ];
      autoStart = true;
    };
    transmission = {
      image = "docker://lscr.io/linuxserver/transmission:latest";
      volumes = [
        "/data/AppData/Transmission:/config"
        "/data/Downloads:/downloads"
        "/data/TV:/tv"
        "/data/Movies:/movies"
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
        "/data/AppData/Radarr:/config"
        "/data/Downloads:/downloads"
        "/data/Movies:/movies"
      ];
      ports = [ 
        "7878:7878" 
      ];
      autoStart = true;
    };
    prowlarr = {
      image = "docker://lscr.io/linuxserver/prowlarr:latest";
      volumes = [
        "/data/AppData/Prowlarr:/config"
      ];
      ports = [ 
        "9696:9696" 
      ];
      autoStart = true;
    };
    jellyseerr = {
      image = "docker://fallenbagel/jellyseerr:latest";
      volumes = [
        "/data/AppData/jellyseer:/app/config"
      ];
      ports = [ 
        "5055:5055" 
      ];
      autoStart = true;
    };
    homepage = {
      image = "docker://ghcr.io/gethomepage/homepage:latest";
      volumes = [
        "/data/AppData/homepage/config:/app/config"
        "/data:/data"
        "/run/podman/podman.sock:/var/run/docker.sock"
      ];
      ports = [ 
        "420:3000"
      ];
      autoStart = true;
    };
    cloudflared-web = {
      image = "docker://wisdomsky/cloudflared-web:latest";
      volumes = [
        "/data/AppData/cloudflare:/config"
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
        "/data/AppData/vaultwarden:/data"
      ];
      
      ports = [ 
        "2456:80" 
      ];
      autoStart = true;
    };

    yarr = {
      image = "docker://ghcr.io/wakeful-cloud/yarr:latest";
      volumes = [
        "/data/AppData/Yarr:/data"
      ];
      
      ports = [ 
        "7070:7070" 
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
        "/run/user/1000/podman/podman.sock:/run/user/1000/podman/podman.sock:ro"
        "/:/hostfs:ro"
      ];
      autoStart = true;
    };

    n8n = {
      image = "docker://docker.n8n.io/n8nio/n8n";
      ports = [
        "5678:5678"
      ];
      volumes = [
        "/data/AppData/n8n:/home/node/.n8n"
      ];
      environment = {
        WEBHOOK_URL = "https://wbhk.theholytachanka.com";
      };
      autoStart = true;
    };

  };
}
