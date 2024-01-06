{ pkgs, lib, spicetify-nix, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      isDefault = true;
      extensions = [
        inputs.firefox-addons.packages."x86_64-linux".darkreader
        inputs.firefox-addons.packages."x86_64-linux".ublock-origin
        inputs.firefox-addons.packages."x86_64-linux".libredirect
        inputs.firefox-addons.packages."x86_64-linux".sponsorblock
        inputs.firefox-addons.packages."x86_64-linux".skip-redirect
        inputs.firefox-addons.packages."x86_64-linux".rsf-censorship-detector
        inputs.firefox-addons.packages."x86_64-linux".refined-github
        inputs.firefox-addons.packages."x86_64-linux".lovely-forks
        inputs.firefox-addons.packages."x86_64-linux".localcdn
        inputs.firefox-addons.packages."x86_64-linux".istilldontcareaboutcookies
        inputs.firefox-addons.packages."x86_64-linux".indie-wiki-buddy
        inputs.firefox-addons.packages."x86_64-linux".dearrow
        inputs.firefox-addons.packages."x86_64-linux".censor-tracker
        inputs.firefox-addons.packages."x86_64-linux".buster-captcha-solver
        inputs.firefox-addons.packages."x86_64-linux".bulgarian-dictionary
        inputs.firefox-addons.packages."x86_64-linux".boring-rss
        inputs.firefox-addons.packages."x86_64-linux".bitwarden
        inputs.firefox-addons.packages."x86_64-linux".behind-the-overlay-revival
        inputs.firefox-addons.packages."x86_64-linux".augmented-steam
      ];
    };
  };
}