{ pkgs, config, lib, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";

        font = "FiraCode Nerd Font:size=11";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
      colors = with config.colorScheme.colors; {
        background = "${base00}";
        foreground = "${base06}";
        regular0 = "${base00}";
        regular1 = "${base08}";
        regular2 = "${base0B}";
        regular3 = "${base0A}";
        regular4 = "${base0D}";
        regular5 = "${base0E}";
        regular6 = "${base0C}";
        regular7 = "${base05}";
        bright0 = "${base03}";
        bright1 = "${base09}";
        bright2 = "${base01}";
        bright3 = "${base02}";
        bright4 = "${base04}";
        bright5 = "${base06}";
        bright6 = "${base0F}";
        bright7 = "${base07}";
      };
    };
  };
}
