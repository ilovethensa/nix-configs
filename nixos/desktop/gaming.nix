{ config, lib, pkgs, modulesPath, chaotic, ... }:

{
  environment.systemPackages = with pkgs; [
    bottles
    lutris
    piper
    cartridges
    mangohud_git
    mangohud32_git
    gamemode
    gamescope
    steamtinkerlaunch
    goverlay
    wineWowPackages.staging
  ];
  programs.steam.enable = true;
  services.ratbagd.enable = true;
  chaotic.mesa-git.enable = true;
}
