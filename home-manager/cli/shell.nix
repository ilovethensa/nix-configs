{ pkgs, lib, inputs, ... }: {
  programs = {
    fish = {
      interactiveShellInit = ''
        ${pkgs.starship}/bin/starship init fish | source

        function cheat
          curl "cheat.sh/$argv"
        end
      '';
      enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza -la";
        cat = "${pkgs.bat}/bin/bat";
        cp = "${pkgs.fcp}/bin/fcp";
        find = "${pkgs.fd}/bin/fd";
        nix-init = "nix flake init -t ~/Projects/nix-configs#$1";
      };
    };
  };
}
