# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:{
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ./services.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  /* # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry; */

  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  networking.hostName = "server";

  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  boot.loader.systemd-boot.enable = true;


  users.mutableUsers = false;

  users.users.tht = {
    isNormalUser = true;
    description = "tht";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxx+GQBdwoeWKEIFct0sbX+U2UxPJkRS910mlVcr3uLv9xvCxGtFJZOKkO57YJZGesdVbwfYzAd1AI9oUyAK9zwMUs2Cd8gMi4pZseGhVTv9b/bw3cx77iyhR0HkuooMpgs2T3pa0TRr5P7927dW4YF61FIrRNNK7Usr+id/YqXszl4JBFqmtPoOS8+3bVaTd1x6E4wpEVOBkep9Cdd46jVXgO34jBdbd7rmB6s6LRyTKFe+IT9OOXHfI89MJBEesjasZo5NSywPEUJL+nTFkJki8AcNOox0g9dk0a7f95ZvSkxBEucgrociqsj4cVKI2rbqVlHIHNYyTANveGIqsWzO/7uu63UwUQ2iiXIXo/FehbshkHl0Dn6mBmB6pXlBhNxd67I48HhiQE5vBX12zu3KIvSnuKbkOUP0xKVYrS9r1jEzAZLF4dsNAGSiZYFeLb4ZP/nZJMDEhSaBFsY700pR4qxw7aTQrHQP4xb6pUuvp9ogtqr+MFTkNeqFxGW6yJ45wQ+wr4BtJsCFCW3aifoG8hVfdPlQqxIDpSyk27raDYOseMmNtbjdnXQLpeOYFqMVUaLX1oVUKsMNwQSgtGjIWr8T6tGQgYXSSgdp5hf0A63mxe35XJrB86/xHb/Z4tYwSG4duVy/lkXTFTu5jJKPQ/5ykCqq+gcHPzkgK/tQ== tht" # content of authorized_keys file
      # note: ssh-copy-id will add user@your-machine after the public key
      # but we can remove the "@your-machine" part
    ];
    initialHashedPassword = "$y$j9T$R.EtRiy8oN715gMKYNMRU1$oVT/2FeQb3YnQfchAxMhb0NiLeljwN7quPVuX2N.1wC";
  };
  users.users.root.initialHashedPassword = "$y$j9T$R.EtRiy8oN715gMKYNMRU1$oVT/2FeQb3YnQfchAxMhb0NiLeljwN7quPVuX2N.1wC";

  boot.loader.efi.canTouchEfiVariables = true;

  security.auditd.enable = true;
  security.audit.enable = true;
  security.audit.rules = [
    "-a exit,always -F arch=b64 -S execve"
  ];

  security.sudo.execWheelOnly = true;

  services.openssh = {
    enable = true;
    extraConfig = ''
      AllowTcpForwarding yes
      X11Forwarding no
      AllowAgentForwarding no
      AllowStreamLocalForwarding no
      AuthenticationMethods publickey
    '';
    settings = {
      KbdInteractiveAuthentication = false;
      challengeResponseAuthentication = false;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };





  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Sofia";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  
  # Enable docker
  virtualisation.docker.enable = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;


  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/nixos" # nixos system config files, can be considered optional
      "/srv"       # service data
      "/var/lib"   # system service persistent data
      "/var/log"   # the place that journald dumps it logs to
    ];
  };

  environment.etc."ssh/ssh_host_rsa_key".source
    = "/nix/persist/etc/ssh/ssh_host_rsa_key";
  environment.etc."ssh/ssh_host_rsa_key.pub".source
    = "/nix/persist/etc/ssh/ssh_host_rsa_key.pub";
  environment.etc."ssh/ssh_host_ed25519_key".source
    = "/nix/persist/etc/ssh/ssh_host_ed25519_key";
  environment.etc."ssh/ssh_host_ed25519_key.pub".source
    = "/nix/persist/etc/ssh/ssh_host_ed25519_key.pub";

  environment.etc."machine-id".source
    = "/nix/persist/etc/machine-id";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
