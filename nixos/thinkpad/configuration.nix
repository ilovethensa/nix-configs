# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs, outputs, lib, config, pkgs, ... }: {
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
    ./gnome.nix
    inputs.home-manager.nixosModules.home-manager
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
  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; }))
    ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = [ "/etc/nix/path" ];
  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;
  nix.allowedUsers = [ "@wheel" ];

  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  networking.hostName = "thinkpad";

  services = {
    fprintd.enable = true;
    thermald.enable = true;
    power-profiles-daemon.enable = true;

    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      excludePackages = with pkgs; [ xterm ];
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    undervolt = {
      enable = true;
      coreOffset = -100;
      gpuOffset = -80;
      tempBat = 65;
    };

    # DBus service that provides power management support to applications.
    upower = {
      enable = true;
      percentageLow = 15;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "Hibernate";
    };

    # superior power management (brought to you by raf :3)
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          #scaling_min_freq = mkDefault (MHz 1800);
          #scaling_max_freq = mkDefault (MHz 3600);
          turbo = "never";
        };
        charger = {
          governor = "performance";
          #scaling_min_freq = mkDefault (MHz 2000);
          #scaling_max_freq = mkDefault (MHz 4800);
          turbo = "auto";
        };
      };
    };

  };

  networking.networkmanager.enable = true;
  programs.dconf.enable = true;
  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  boot.bootspec.enable = true;
  boot = {
    loader.systemd-boot.enable = lib.mkForce false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.systemPackages = with pkgs; [
    # Gui
    firefox
    spotify
    vesktop
    acpi
    powertop
    sway
  ];

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
  };
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];
  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/nixos" # nixos system config files, can be considered optional
      "/srv" # service data
      "/var/lib" # system service persistent data
      "/var/log" # the place that journald dumps it logs to
      "/etc/innernet" # Innernet stuff
      "/usr/share/secureboot/"
      "/etc/secureboot"
      {
        directory = "/home/tht";
        user = "tht";
      }
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      tht = import ../../home-manager/home.nix;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
