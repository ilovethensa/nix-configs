{ pkgs ? import (fetchTarball {
  url =
    "https://github.com/NixOS/nixpkgs/archive/4fe8d07066f6ea82cda2b0c9ae7aee59b2d241b3.tar.gz";
  sha256 = "sha256:06jzngg5jm1f81sc4xfskvvgjy5bblz51xpl788mnps1wrkykfhp";
}) { } }:
buildGoModule rec {
  pname = "nom";
  version = "2.1.1";

  src = fetchFromGitHub {
    owner = "guyfedwards";
    repo = "nom";
    rev = "0747c137aa1273b052b223762fea2e0266429beb";
    sha256 = "0m2fzpqxk7hrbxsgqplkg7h2p7gv6s1miymv3gvw0cz039skag0s";
  };

  vendorSha256 = "1879j77k96684wi554rkjxydrj8g3hpp0kvxz03sd8dmwr3lh83j";

  meta = with lib; {
    description = "RSS reader for the terminal ";
    homepage = "https://github.com/guyfedwards/nom";
    license = licenses.gpl3;
    maintainers = with maintainers; [ tht ];
  };
}
