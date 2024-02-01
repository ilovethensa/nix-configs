{ pkgs, lib, inputs, ... }:
let
  bookmark-open = pkgs.writeScriptBin "bookmark-open" ''
url=$(${pkgs.nb}/bin/nb list | ${pkgs.fzf}/bin/fzf --ansi --header="Select a bookmark" | ${pkgs.gnused}/bin/sed -n 's/.*(\(.*\))/\1/p')
if [ ! -z "$url" ]; then
    swaymsg exec xdg-open "https://$url"
else
    echo "URL is None. Skipping execution."
fi
'';
  movie-script = pkgs.writeScriptBin "movie" ''
#!${pkgs.stdenv.shell}
movie=$("${pkgs.fd}/bin/fd" -e mkv -e mp4 . /home/tht/Videos/Media | uniq -u | grep -v -e "Sample" -e "sample" | "${pkgs.fzf}/bin/fzf" --prompt='Play movie: ' --height 100% --cycle )
 if [ ! -z "$movie" ]; then
    swaymsg exec "${pkgs.vlc}/bin/vlc" "$movie"
else
    echo "movie is None. Skipping execution."
    fi 
'';
in {
   home.packages = [ movie-script bookmark-open ];
}

