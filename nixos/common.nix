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
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

    # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users.root.initialHashedPassword = "$y$j9T$R.EtRiy8oN715gMKYNMRU1$oVT/2FeQb3YnQfchAxMhb0NiLeljwN7quPVuX2N.1wC";
  users.users.tht = {
    isNormalUser = true;
    description = "tht";
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxx+GQBdwoeWKEIFct0sbX+U2UxPJkRS910mlVcr3uLv9xvCxGtFJZOKkO57YJZGesdVbwfYzAd1AI9oUyAK9zwMUs2Cd8gMi4pZseGhVTv9b/bw3cx77iyhR0HkuooMpgs2T3pa0TRr5P7927dW4YF61FIrRNNK7Usr+id/YqXszl4JBFqmtPoOS8+3bVaTd1x6E4wpEVOBkep9Cdd46jVXgO34jBdbd7rmB6s6LRyTKFe+IT9OOXHfI89MJBEesjasZo5NSywPEUJL+nTFkJki8AcNOox0g9dk0a7f95ZvSkxBEucgrociqsj4cVKI2rbqVlHIHNYyTANveGIqsWzO/7uu63UwUQ2iiXIXo/FehbshkHl0Dn6mBmB6pXlBhNxd67I48HhiQE5vBX12zu3KIvSnuKbkOUP0xKVYrS9r1jEzAZLF4dsNAGSiZYFeLb4ZP/nZJMDEhSaBFsY700pR4qxw7aTQrHQP4xb6pUuvp9ogtqr+MFTkNeqFxGW6yJ45wQ+wr4BtJsCFCW3aifoG8hVfdPlQqxIDpSyk27raDYOseMmNtbjdnXQLpeOYFqMVUaLX1oVUKsMNwQSgtGjIWr8T6tGQgYXSSgdp5hf0A63mxe35XJrB86/xHb/Z4tYwSG4duVy/lkXTFTu5jJKPQ/5ykCqq+gcHPzkgK/tQ== tht" # content of authorized_keys file
      # note: ssh-copy-id will add user@your-machine after the public key
      # but we can remove the "@your-machine" part
    ];
    shell = pkgs.fish;
    initialHashedPassword = "$y$j9T$R.EtRiy8oN715gMKYNMRU1$oVT/2FeQb3YnQfchAxMhb0NiLeljwN7quPVuX2N.1wC";
  };
  programs.fish.enable = true;
  
}