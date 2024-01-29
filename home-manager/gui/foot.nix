{ pkgs, lib, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      cursors = {
        color = "c0caf5 2e3c64";
      };
      main = {
        term = "xterm-256color";

        font = "Fira Code:size=11";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        foreground = "c0caf5";
        background = "24283b";
        selection-foreground = "c0caf5";
        selection-background = "2e3c64";
        urls = "73daca";

        regular0 = "1d202f";
        regular1 = "f7768e";
        regular2 = "9ece6a";
        regular3 = "e0af68";
        regular4 = "7aa2f7";
        regular5 = "bb9af7";
        regular6 = "7dcfff";
        regular7 = "a9b1d6";

        bright0 = "414868";
        bright1 = "f7768e";
        bright2 = "9ece6a";
        bright3 = "e0af68";
        bright4 = "7aa2f7";
        bright5 = "bb9af7";
        bright6 = "7dcfff";
        bright7 = "c0caf5";

        16 = "ff9e64";
        17 = "db4b4b";
      };
    };
  };
}
