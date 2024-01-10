{ pkgs, lib, spicetify-nix, ... }:
let spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [ spicetify-nix.homeManagerModule ];
  programs.spicetify = {
    # spotifyPackage = pkgs.spotify-wrapped;
    enable = false;
    /* injectCss = true;
        replaceColors = true;

        overwriteAssets = true;
        sidebarConfig = true;
        enabledExtensions = with spicePkgs.extensions; [
          fullAppDisplay
          shuffle # shuffle+ (special characters are sanitized out of ext names)
          hidePodcasts
          playlistIcons
          lastfm
          genre
          historyShortcut
          bookmark
          fullAlbumDate
          groupSession
          popupLyrics
        ];
    */
  };
}
