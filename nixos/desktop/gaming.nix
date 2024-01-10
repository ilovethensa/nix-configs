{ config, lib, pkgs, modulesPath, ... }:

{
  environment.systemPackages = with pkgs; [
    bottles
    lutris
    piper
    cartridges
    mangohud
    gamemode
    gamescope
    steamtinkerlaunch
    goverlay
    wineWowPackages.staging
  ];
  programs.steam.enable = true;
  services.ratbagd.enable = true;
}
