{ pkgs }:

pkgs.writeShellScriptBin "movie" ''
    ${pkgs.findutils}/bin/find ~/Downloads -type f -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -exec ${pkgs.vlc}/bin/vlc {} +
''