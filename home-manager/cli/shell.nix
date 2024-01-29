{ pkgs, lib, inputs, ... }: {
  programs = {
    fish = {
      interactiveShellInit = ''
                ${pkgs.starship}/bin/starship init fish | source
function movie
    set file (find -e mpv -e mkv --type f ~/Downloads/ | fzf)
    if test -n "$file"
        vlc "$file"
    end
end

      '';
      functions = {
        nix-init = ''
          if test -z $argv
              echo "Usage: nix-init <ARGUMENT>"
          else
              nix flake init -t ~/nix-configs#$argv
          end'';
        help = ''
          curl -s cheat.sh/$argv'';
        };
      enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza -la";
        cat = "${pkgs.bat}/bin/bat";
        cp = "${pkgs.fcp}/bin/fcp";
        find = "${pkgs.fd}/bin/fd";
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
