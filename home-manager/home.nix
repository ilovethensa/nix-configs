# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./dconf.nix
    #./spicetify.nix
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
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "tht";
    homeDirectory = "/home/tht";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userEmail = "me@theholytachanka.com";
    userName = "Linus Torvalds";
  };
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      isDefault = true;
      extensions = [
        inputs.firefox-addons.packages."x86_64-linux".darkreader
        inputs.firefox-addons.packages."x86_64-linux".ublock-origin
        inputs.firefox-addons.packages."x86_64-linux".libredirect
        inputs.firefox-addons.packages."x86_64-linux".sponsorblock
        inputs.firefox-addons.packages."x86_64-linux".skip-redirect
        inputs.firefox-addons.packages."x86_64-linux".rsf-censorship-detector
        inputs.firefox-addons.packages."x86_64-linux".refined-github
        inputs.firefox-addons.packages."x86_64-linux".lovely-forks
        inputs.firefox-addons.packages."x86_64-linux".localcdn
        inputs.firefox-addons.packages."x86_64-linux".istilldontcareaboutcookies
        inputs.firefox-addons.packages."x86_64-linux".indie-wiki-buddy
        inputs.firefox-addons.packages."x86_64-linux".dearrow
        inputs.firefox-addons.packages."x86_64-linux".censor-tracker
        inputs.firefox-addons.packages."x86_64-linux".buster-captcha-solver
        inputs.firefox-addons.packages."x86_64-linux".bulgarian-dictionary
        inputs.firefox-addons.packages."x86_64-linux".boring-rss
        inputs.firefox-addons.packages."x86_64-linux".bitwarden
        inputs.firefox-addons.packages."x86_64-linux".behind-the-overlay-revival
        inputs.firefox-addons.packages."x86_64-linux".augmented-steam
      ];
    };
  };
  programs.fish = {
    interactiveShellInit = ''
    starship init fish | source
    thefuck --alias | source 
    '';
    enable = true;
    shellAliases = {
      rebuild-sys = "sudo nixos-rebuild switch --flake /home/tht/Documents/nix#desktop";
      rebuild-home = "home-manager switch --flake /home/tht/Documents/nix";
      rebuild = "rebuild-sys && rebuild-home";
      help = "tldr \"$@\" || man \"$@\"";
    };
  };
  programs.thefuck.enable = true;
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
