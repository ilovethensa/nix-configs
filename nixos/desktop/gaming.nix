{ config, lib, pkgs, modulesPath, chaotic, ... }:

{
  environment.systemPackages = with pkgs; [
    bottles
    lutris
    mangohud
    gamemode
    gamescope
    winePackages.wayland
  ];
  programs.steam.enable = true;
}
