{ config, lib, pkgs, ... }:

{
  services = {
    tor = {
      enable = true;
      settings.DNSPort = lib.mkForce 53;
      client = {
        enable = true;
        dns.enable = true;
      };
    };
    stubby = {
      enable = true;
      settings = pkgs.stubby.passthru.settingsExample // {
        listen_addresses = [ "127.0.0.15" ];
        upstream_recursive_servers = [
          {
            address_data = "1.1.1.1";
            tls_auth_name = "cloudflare-dns.com";
            tls_pubkey_pinset = [{
              digest = "sha256";
              value = "GP8Knf7qBae+aIfythytMbYnL+yowaWVeD6MoLHkVRg=";
            }];
          }
          {
            address_data = "1.0.0.1";
            tls_auth_name = "cloudflare-dns.com";
            tls_pubkey_pinset = [{
              digest = "sha256";
              value = "GP8Knf7qBae+aIfythytMbYnL+yowaWVeD6MoLHkVRg=";
            }];
          }
        ];
      };
    };

  };
  networking = {
    nameservers = [ "127.0.0.1" "127.0.0.15" ];
    # If using dhcpcd:
    dhcpcd.extraConfig = "nohook resolv.conf";
    # If using NetworkManager:
    networkmanager.dns = "none";
  };

}
