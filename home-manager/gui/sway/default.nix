{ lib
, pkgs
, config
, wayland
, hardware
, ...
}:

let
  mod = "Mod4";

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

  ${displayServer} = {
    windowManager.${windowManager} = {
      enable = true;

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
          "${workspaces.ws2}" = [{ class = "vesktop"; }];
          "${workspaces.ws3}" = [{ class = "firefox"; }];
          "${workspaces.ws4}" = [{ class = "Code"; }];
          "${workspaces.ws5}" = [
            { class = "steam"; } 
            { class = "com.usebottles.bottles"; } 
            { class = "lutris"; }
          ];
          "${workspaces.ws6}" = [{ class = "Spotify"; }];
          "${workspaces.ws10}" = [{ class = "org.qbittorrent.qBittorrent"; }];
        };

        floating.criteria = [
          # Default to floating windows for everything but the main window.
          { class = "steam"; title = "[^Steam]"; } # See https://github.com/ValveSoftware/steam-for-linux/issues/1040
          { class = "ghidra-Ghidra"; title = "^(?!(CodeBrowser.*|Ghidra.*))"; }
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
'';
    };
  };
    home.packages = [
      pkgs.foot
    ];
}
