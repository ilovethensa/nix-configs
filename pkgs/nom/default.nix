{ fetchFromGitHub, buildGoModule, lib, pkg, ... }:
buildGoModule rec {
  pname = "nom";
  version = "2.1.1";

  src = fetchFromGitHub {
    owner = "guyfedwards";
    repo = "nom";
    rev = "0747c137aa1273b052b223762fea2e0266429beb";
    sha256 = "0m2fzpqxk7hrbxsgqplkg7h2p7gv6s1miymv3gvw0cz039skag0s";
  };

  vendorHash = "sha256-6hCgv2/8UIRHw1kCe3nLkxF23zE/7t5RDwEjSzX3pBQ=";

  meta = with lib; {
    description = "RSS reader for the terminal ";
    homepage = "https://github.com/guyfedwards/nom";
    license = licenses.gpl3;
    maintainers = with maintainers; [ tht ];
  };
}
