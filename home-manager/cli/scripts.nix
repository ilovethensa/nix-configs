{ pkgs, lib, inputs, ... }:
let
  movie-script = pkgs.writeScriptBin "movie" ''
#!${pkgs.stdenv.shell}
movie=$("${pkgs.fd}/bin/fd" -e mkv -e mp4 . /home/tht/Downloads | uniq -u | grep -v -e "Sample" -e "sample" | "${pkgs.fzf}/bin/fzf" --prompt='Play movie: ' --height 100% --cycle )
swaymsg exec "${pkgs.vlc}/bin/vlc" "$movie"
  '';
in {
   home.packages = [ movie-script ];
}

