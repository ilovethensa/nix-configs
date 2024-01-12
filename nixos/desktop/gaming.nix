{ config, lib, pkgs, modulesPath, chaotic, ... }:

{
  environment.systemPackages = with pkgs; [
    bottles
    lutris
    piper
    cartridges
    mangohud
    gamemode
    gamescope
    goverlay
    wineWowPackages.staging
  ];
  programs.steam.enable = true;
  services.ratbagd.enable = true;
}
