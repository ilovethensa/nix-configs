{ pkgs, lib, ... }:
{
  programs.fish = {
    interactiveShellInit = ''
    starship init fish | source
    zoxide init fish | source
    '';
    enable = true;
    shellAliases = {
      ls = "exa";
      cd = "z";
      cat = "bat";
    };
  };
  programs.thefuck.enable = true;
  programs.starship.enable = true;
  home.packages = with pkg; [
      zoxide
      eza
      fuc
      bat
      fd
  ];
}