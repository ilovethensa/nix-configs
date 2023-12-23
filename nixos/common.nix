{ config, lib, pkgs, ... }:

{
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxx+GQBdwoeWKEIFct0sbX+U2UxPJkRS910mlVcr3uLv9xvCxGtFJZOKkO57YJZGesdVbwfYzAd1AI9oUyAK9zwMUs2Cd8gMi4pZseGhVTv9b/bw3cx77iyhR0HkuooMpgs2T3pa0TRr5P7927dW4YF61FIrRNNK7Usr+id/YqXszl4JBFqmtPoOS8+3bVaTd1x6E4wpEVOBkep9Cdd46jVXgO34jBdbd7rmB6s6LRyTKFe+IT9OOXHfI89MJBEesjasZo5NSywPEUJL+nTFkJki8AcNOox0g9dk0a7f95ZvSkxBEucgrociqsj4cVKI2rbqVlHIHNYyTANveGIqsWzO/7uu63UwUQ2iiXIXo/FehbshkHl0Dn6mBmB6pXlBhNxd67I48HhiQE5vBX12zu3KIvSnuKbkOUP0xKVYrS9r1jEzAZLF4dsNAGSiZYFeLb4ZP/nZJMDEhSaBFsY700pR4qxw7aTQrHQP4xb6pUuvp9ogtqr+MFTkNeqFxGW6yJ45wQ+wr4BtJsCFCW3aifoG8hVfdPlQqxIDpSyk27raDYOseMmNtbjdnXQLpeOYFqMVUaLX1oVUKsMNwQSgtGjIWr8T6tGQgYXSSgdp5hf0A63mxe35XJrB86/xHb/Z4tYwSG4duVy/lkXTFTu5jJKPQ/5ykCqq+gcHPzkgK/tQ== tht" # content of authorized_keys file
    # note: ssh-copy-id will add user@your-machine after the public key
    # but we can remove the "@your-machine" part
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };
}