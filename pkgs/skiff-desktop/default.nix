{ lib, buildInputs, fetchFromGitHub, meson, ninja, pkg-config, vala, python3, glib, libgee, desktop-file-utils, python311Packages, gtk4, libadwaita, blueprint-compiler, webkitgtk_6_0, appstream, cmake }:

# Function to generate the derivation
with lib;

let
  skiffAdwVersion = "0.1.6";
  skiffAdwHash = "sha256-of-skiff-adw-source-code";

  # Define the package
  skiffAdw = stdenv.mkDerivation {
    pname = "skiff-desktop";
    version = skiffAdwVersion;
    src = fetchFromGitHub {
      owner = "FyraLabs";
      repo = "skiff-desktop";
      rev = skiffAdwVersion;
      sha256 = skiffAdwHash;
    };

    nativeBuildInputs = [ meson ninja ];

    buildInputs = [
      pkg-config vala python3 glib libgee desktop-file-utils python311Packages.pygobject3
      gtk4 libadwaita blueprint-compiler webkitgtk_6_0 appstream cmake
    ];

    # Build phase
    buildPhase = ''
      meson _build --prefix=/usr
      cd _build
      ninja
    '';

    # Install phase
    installPhase = ''
      sudo mkdir -p $out/usr
      sudo cp -r _build/* $out/usr/
    '';

    # Specify the output directory for the package
    meta = with lib; {
      description = "Skiff, now on a Linux Desktop near you!";
      license = licenses.mit;
    };
  };

in
  skiffAdw
