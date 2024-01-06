{
  pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/4fe8d07066f6ea82cda2b0c9ae7aee59b2d241b3.tar.gz";
    sha256 = "sha256:06jzngg5jm1f81sc4xfskvvgjy5bblz51xpl788mnps1wrkykfhp";
  }) {}
}:
pkgs.stdenv.mkDerivation rec {
  pname = "skiff-desktop";
  version = "0.1.0";

  src = pkgs.fetchgit {
    url = "https://github.com/dhadder3/skiffdesktop-adw";
    rev = "71027a10a925cf283fcddae3bbb718914dd797f2";
    sha256 = "sha256-LjkTHZfWh9RT5uxv29omt0hM/dMv7Vo9LWLJKfCqrtU=";
  };

  buildInputs = [
    pkgs.pkg-config 
    pkgs.vala 
    pkgs.python3 
    pkgs.glib 
    pkgs.libgee 
    pkgs.desktop-file-utils 
    pkgs.python311Packages.pygobject3
    pkgs.gtk4 
    pkgs.libadwaita 
    pkgs.blueprint-compiler 
    pkgs.webkitgtk_6_0 
    pkgs.appstream 
    pkgs.cmake
    pkgs.meson
    pkgs.ninja
  ];

  configurePhase = ''
    meson _build --prefix=$out
  '';

  buildPhase = ''
    cd _build
    ninja
  '';

/*   installPhase = ''
    mkdir -p $out/bin
    mv chord $out/bin
  ''; */
}