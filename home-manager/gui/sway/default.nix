{ lib
, pkgs
, config
, wayland
, hardware
, ...
}:

let
  mod = "Mod1";

  workspaces = {
    ws1 = "1";
    ws2 = "2: Discord";
    ws3 = "3: Browser";
    ws4 = "4: Coding";
    ws5 = "5: Games";
    ws6 = "6: Music";
    ws7 = "7";
    ws8 = "8";
    ws9 = "9";
    ws10 = "10";
  };

  displayServer = "wayland";
  windowManager = "sway";
in
{
  imports = [
    ./bar.nix
  ];
  ${displayServer} = {
    windowManager.${windowManager} = {
      enable = false;

      config = {
        keybindings = import ./keybindings.nix { inherit config pkgs mod workspaces windowManager lib; };
        terminal = "${pkgs.foot}/bin/foot";
        defaultWorkspace = "workspace ${workspaces.ws1}";
        modifier = mod;

        # Disable default resize mode
        modes = { };

        gaps = {
          inner = 4;
          outer = 4;
        };

        assigns = {
          "${workspaces.ws2}" = [{ app_id = "vesktop"; }];
          "${workspaces.ws3}" = [{ app_id = "firefox"; }];
          "${workspaces.ws4}" = [{ class = "Code"; }];
          "${workspaces.ws5}" = [
            { class = "steam"; } 
            { app_id = "com.usebottles.bottles"; } 
            { app_id = "lutris"; }
          ];
          "${workspaces.ws6}" = [{ title = "Spotify"; }];
          "${workspaces.ws10}" = [{ app_id = "org.qbittorrent.qBittorrent"; }];
        };

        floating.criteria = [
          # Default to floating windows for everything but the main window.
          { class = "steam"; title = "[^Steam]"; } # See https://github.com/ValveSoftware/steam-for-linux/issues/1040
          { class = "ghidra-Ghidra"; title = "^(?!(CodeBrowser.*|Ghidra.*))"; }
        ];
        startup = [
          { command = "spotify"; }
          { command = "vesktop"; }
          { command = "firefox"; }
          { command = "qbittorrent"; }
          #{ command = "${pkgs.gammastep}/bin/gammastep -t 6500:2000"; }
        ];
        bars = [
          {
            position = "top";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
            fonts = {
              names = [ "FiraCode Nerd Font" ];
              style = "Bold Semi-Condensed";
              size = 9.0;
            };
          }
        ];
      };
      wrapperFeatures.gtk = true;
      extraConfig = ''
for_window [shell="xwayland"] title_format "[XWayland] %title"
default_border none
default_floating_border none
for_window [class="^steam$"] floating enable
for_window [class="^Steam$"] floating enable
for_window [class="^steam$" title="^Steam$"] floating disable
for_window [app_id="launcher"] floating enable, border pixel 2
for_window [app_id="firefox" title="^Picture-in-Picture$"] \
    floating enable, move position 1265 696, resize set 580 328, sticky enable

input "2:8:AlpsPS/2_ALPS_DualPoint_TouchPad" {
   tap enabled
   natural_scroll enabled
}
bindgesture swipe:right workspace prev 
bindgesture swipe:left workspace next 

'';
    };
  };
}
