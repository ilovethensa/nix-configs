{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {
            block = "disk_space";
            path = "/nix";
            info_type = "available";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "cpu";
            interval = 1;
          }
          { block = "sound"; }
          {
            block = "time";
            interval = 60;
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
          }
        ];
        settings = {
          theme =  {
            theme = "srcery";
            overrides = {
              idle_bg = "#123456";
              idle_fg = "#abcdef";
            };
          };
        };
        icons = "material-nf";
        theme = "srcery";
      };
    };
  };
}
