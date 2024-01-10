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
    ./spotify.nix
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

    };
    btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = [ "/" ];
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

  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  boot.loader.systemd-boot.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.systemPackages = with pkgs; [
    # Gui
    firefox
    vscodium
    spotify
    vesktop
    # Themes
    adw-gtk3
    vimix-icon-theme
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.app-hider
    acpi
    powertop
  ];

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
