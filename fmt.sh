nix-shell -p nixfmt --command "nixfmt ."
nix run nixpkgs#statix -- check