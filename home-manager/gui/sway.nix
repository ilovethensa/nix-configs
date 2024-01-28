{ pkgs, lib, inputs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "foot"; 
      gaps.inner = 10;
    };
  };
  programs.foot.enable = true;
}
