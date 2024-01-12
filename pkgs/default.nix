# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{ pkgs, ... }: {
  example = pkgs.callPackage ./example { };
  #skiff-desktop = pkgs.callPackage ./skiff-desktop { };
  morewaita = pkgs.callPackage ./morewaita { };
}
