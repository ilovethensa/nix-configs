# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  skiff-desktop = pkgs.callPackage ./skiff-desktop/default.nix { };
}
