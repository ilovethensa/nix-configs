{ pkgs }:

pkgs.writeShellScriptBin "movie" ''
    ${pkgs.findutils}/bin/find ~/Downloads -type f -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" | ${pkgs.fzf}/bin/fzf | xargs ${pkgs.vlc}/bin/vlc
''