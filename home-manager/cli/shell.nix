{ pkgs, lib, inputs, ... }: {
  programs = {
    zsh = {
      interactiveShellInit = ''
        eval "$(${pkgs.starship}/bin/starship init zsh)"
      '';
      enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza -la";
        cat = "${pkgs.bat}/bin/bat";
        cp = "${pkgs.fcp}/bin/fcp";
        find = "${pkgs.fd}/bin/fd";
        movie = "${pkgs.fd}/bin/fd -e mpv -e mkv --type f ~/Downloads/ | ${pkgs.fzf}/bin/fzf | ${pkgs.vlc}/bin/vlc";
        nix-init = "nix flake init -t ~/Projects/nix-configs#$1";
        help = "curl -s cheat.sh/$@";
      };
      enableAutosuggestions = true;
      enableCompletion = true;
    };
  };
}
