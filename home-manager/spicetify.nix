{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    spotifyPackage = pkgs.spotify-wrapped;
    enable = true;
    injectCss = true;
    replaceColors = true;

    overwriteAssets = true;
    sidebarConfig = true;
    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
      new-releases
    ];

    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";

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
  };
}
