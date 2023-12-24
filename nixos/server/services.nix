# configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    ./jellyfin.nix
  ];

  # Enable docker socket for homepage docker integration
  virtualisation.podman.dockerSocket.enable = true;

  virtualisation.oci-containers.containers = {
    #filebrowser = {
    #  image = "docker://filebrowser/filebrowser";
    #  volumes = [
    #    "/portainer:/srv"
    #    "/data/AppData/filebrowser/config/database.db:/database.db"
    #  ];
    #  ports = [ 
    #    "1010:80" 
    #  ];
    #  autoStart = true;
    #};
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

    adguard = {
      image = "docker://adguard/adguardhome:latest";
      volumes = [
        "/data/AppData/adguard/config:/opt/adguardhome/work"
        "/data/AppData/adguard/work:/opt/adguardhome/conf"
      ];
      ports = [ 
        "8888:3000"
        "53:53/tcp"
        "53:53/udp"
        "67:67/udp"
        "5555:68/udp"
        "4444:80/tcp"
        "443:443/tcp"
        "443:443/udp"
        "3000:3000/tcp"
        "853:853/tcp"
        "784:784/udp"
        "853:853/udp"
        "8853:8853/udp"
        "5443:5443/tcp"
        "5443:5443/udp"
      ];
      autoStart = true;
    };
  };
}
