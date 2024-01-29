{ config, lib, pkgs, modulesPath, chaotic, ... }:

{
  environment.systemPackages = with pkgs; [
    bottles
    lutris
    mangohud
    gamemode
    gamescope
    wineWowPackages.staging
  ];
  programs.steam.enable = true;
}
