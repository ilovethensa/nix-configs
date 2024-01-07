{ config, lib, pkgs, modulesPath, ... }:

{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    epiphany # web browser
    geary # email reader
    evince # document viewer
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    gnome-system-monitor # Resource monitor
  ]);
  environment.systemPackages = with pkgs; [ 
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.app-hider
    #resources
  ];
  environment.sessionVariables = rec {
    QT_QPA_PLATFORMTHEME  = "gtk2";
  };
}