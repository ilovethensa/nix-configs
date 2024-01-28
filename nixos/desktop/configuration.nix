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
    #./kde.nix
    ./kernel.nix
    ./gpu.nix
    ./audio.nix
    ./gaming.nix
    ./misc.nix
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
      /* (final: prev: {
              gnome = prev.gnome.overrideScope' (gnomeFinal: gnomePrev: {
                mutter = gnomePrev.mutter.overrideAttrs ( old: {
                  src = pkgs.fetchgit {
                    url = "https://gitlab.gnome.org/vanvugt/mutter.git";
                    # GNOME 45: triple-buffering-v4-45
                    rev = "0b896518b2028d9c4d6ea44806d093fd33793689";
                    sha256 = "sha256-mzNy5GPlB2qkI2KEAErJQzO//uo8yO0kPQUwvGDwR4w=";
                  };
                } );
              });
            })
      */
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
  networking.hostName = "desktop";

  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  boot.loader.systemd-boot.enable = true;

  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
  };

  # Enable the X11 windowing system.
  environment = {
    systemPackages = with pkgs; [
      # Gui
      firefox
      spotify
      vesktop
      heroic
      obs-studio
      droidcam
      celeste
      qbittorrent
      vlc
      anytype
      jetbrains.idea-community-bin
      # Cli
      tealdeer
      wget
      hashcat
      appimage-run
      cargo
      gcc
      rustc
      gcc
      rustfmt
      clippy
      innernet

      # For minecraft
      openjdk17
    ];
    persistence."/nix/persist" = {
      directories = [
        "/etc/nixos" # nixos system config files, can be considered optional
        "/srv" # service data
        "/var/lib" # system service persistent data
        "/var/log" # the place that journald dumps it logs to
        "/etc/innernet" # Innernet stuff
        {
          directory = "/home/tht";
          user = "tht";
        }
      ];
    };
  };

  # Virtual machines
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  # Disabled firewall
  networking.firewall.enable = false;

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
