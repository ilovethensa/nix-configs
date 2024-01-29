{ pkgs, lib, inputs, ... }:
let
  movieScript = ''
    fn movie() {
       movie=$(${pkgs.fd}/bin/fd -e mkv -e mp4 . /home/tht/Downloads | uniq -u | ${pkgs.fzf}/bin/fzf)
       ${pkgs.vlc}/bin/vlc $movie
    }
    '';
in {
  home.file.".local/bin/movie".text = movieScript;
}
