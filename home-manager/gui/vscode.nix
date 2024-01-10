{ pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages
      (ps: with ps; [ zlib openssl.dev pkg-config ]);
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      eamodio.gitlens
      usernamehw.errorlens
      jnoortheen.nix-ide
    ];
  };
}
