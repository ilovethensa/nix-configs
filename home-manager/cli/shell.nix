{ pkgs, lib, inputs, ... }: {
  programs = {
    fish = {
      interactiveShellInit = ''
        starship init fish | source
      '';
      enable = true;
      shellAliases = {
        ls = "exa";
        cat = "bat";
      };
    };
    thefuck.enable = true;
    starship.enable = true;
  };
  home.packages = with pkgs; [ eza fuc bat fd ];
}
