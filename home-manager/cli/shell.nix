{ pkgs, lib, inputs, ... }: {
  programs = {
    fish = {
      interactiveShellInit = ''
                ${pkgs.starship}/bin/starship init fish | source
      '';
      functions = {
        nix-init = ''
            if test -z $argv
                echo "Usage: nix-init <ARGUMENT>"
            else
                nix flake init -t ~/nix-configs#$argv
            end'';
      __fish_command_not_found_handler = {
        body = ''
    tldr $argv; or
    man $argv; or
    $argv --help; or
    $argv -h''
        onEvent = "fish_command_not_found";
      };
      };
      enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza";
        cat = "${pkgs.bat}/bin/bat";
        cp = "${pkgs.fcp}/bin/fcp";
      };
      plugins = [
        {
          name = "fish-insulter";
          src = pkgs.fetchFromGitHub {
            owner = "Alaz-Oz";
            repo = "fish-insulter";
            rev = "d9538a189c9cdabc90d6b62c2cdd716284954708";
            sha256 = "VCORARW5tJYJlRxVdwLf3CMET4PY7Qzy28CT1EzBq5I=";
          };
        }
      ];

    };
    starship.enable = true;
  };
}
