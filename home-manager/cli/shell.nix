{ pkgs, lib, inputs, ... }: {
  programs = {
    fish = {
      interactiveShellInit = ''
        starship init fish | source
function nix-init
    if test -z $argv
        echo "Usage: nix-init <ARGUMENT>"
    else
        nix flake init -t ~/nixos-configs#$argv
    end
end

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
