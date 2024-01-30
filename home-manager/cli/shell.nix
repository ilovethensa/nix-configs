{ pkgs, lib, inputs, ... }: {
  programs = {
    zsh = {
      initExtra = ''
        eval "$(${pkgs.starship}/bin/starship init zsh)"
	export PATH=/home/tht/.local/bin:$PATH
      '';
      enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza -la";
        cat = "${pkgs.bat}/bin/bat";
        cp = "${pkgs.fcp}/bin/fcp";
        find = "${pkgs.fd}/bin/fd";
        nix-init = "nix flake init -t ~/Projects/nix-configs#$1";
        help = "curl -s cheat.sh/$@";
      };
      enableAutosuggestions = true;
      enableCompletion = true;
    };
  };
}
