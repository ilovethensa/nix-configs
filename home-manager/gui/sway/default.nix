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
    ws2 = "2: Coding";
    ws3 = "3: Browser";
    ws4 = "4: Music";
    ws5 = "5: Games";
    ws6 = "6";
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
        terminal = terminal = "foot";
        defaultWorkspace = "workspace ${workspaces.ws1}";
        modifier = mod;

        # Disable default resize mode
        modes = { };

        gaps = {
          inner = 4;
          outer = 4;
        };

        startup = [
          { command = "--no-startup-id ${pkgs.alsa-utils}/bin/amixer set Master 35%"; always = false; }
          { command = "--no-startup-id ${pkgs.redshift}/bin/redshift -l 50.77083:3.57361 -t 6500K:3000K"; always = false; }
        ] ++ lib.optionals (displayServer == "wayland") [
          # Wallpaper
          { command = "--no-startup-id ${pkgs.swaybg}/bin/swaybg -i ${config.xdg.configHome}/wallpapers/spirited_away.png"; always = false; }
        ] ++ lib.optionals (displayServer == "xsession") [
          # Wallpaper
          { command = "--no-startup-id ${pkgs.xwallpaper}/bin/xwallpaper --daemon --zoom ${config.xdg.configHome}/wallpapers/spirited_away.png"; always = false; }
          # Tray icon application that lets you disable auto-sleep
          { command = "--no-startup-id ${pkgs.caffeine-ng}/bin/caffeine"; always = false; }
        ];

        assigns = {
          "${workspaces.ws2}" = [{ class = "electronplayer"; }];
          "${workspaces.ws3}" = [
            { class = "discord"; }
            { class = "element"; }
          ];
          "${workspaces.ws4}" = [{ class = "Psst-gui"; }];
          "${workspaces.ws10}" = [{ class = "Transmission-gtk"; }];
          "${workspaces.ws5}" = [{ class = "steam"; }];
        };

        floating.criteria = [
          # Default to floating windows for everything but the main window.
          { class = "steam"; title = "[^Steam]"; } # See https://github.com/ValveSoftware/steam-for-linux/issues/1040
          { class = "ghidra-Ghidra"; title = "^(?!(CodeBrowser.*|Ghidra.*))"; }
        ];
      };
    } // lib.optionalAttrs (windowManager == "sway") {
      wrapperFeatures.gtk = true;
    };
  } // lib.optionalAttrs (displayServer == "xsession") {
    # Generate a script to start the X server, used by the login manager
    enable = true;
    scriptPath = ".hm-graphical-session";
  };
}
