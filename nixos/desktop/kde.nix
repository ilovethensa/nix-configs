{ config, lib, pkgs, modulesPath, ... }:

{
  services.xserver = {
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasmawayland";
    };
    desktopManager.plasma5.enable = true;
  };
}
