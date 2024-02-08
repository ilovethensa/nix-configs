{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.i3status-rust = {
    enable = false;
    bars = {
      top = {
        blocks = [
          {
            block = "battery";
            missing_format = "";
          }
          #{
          #  block = "hueshift";
          #  hue_shifter = "gammastep";
          #  step = 50;
          #  click_temp = 2000;
          #}
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
        settings = { theme = { theme = "native"; }; };
        icons = "material-nf";
        theme = "native";
      };
    };
  };
  #home.packages = with pkgs; [
  #  gammastep
  #];
}
