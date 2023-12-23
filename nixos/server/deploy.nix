{ pkgs, ... }:
{
  users.groups.deploy = { };
  users.users.deploy = {
    isSystemUser = true;
    group = "deploy";
    shell = pkgs.bash;
    start

    openssh.authorizedKeys.keys = [
      ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxx+GQBdwoeWKEIFct0sbX+U2UxPJkRS910mlVcr3uLv9xvCxGtFJZOKkO57YJZGesdVbwfYzAd1AI9oUyAK9zwMUs2Cd8gMi4pZseGhVTv9b/bw3cx77iyhR0HkuooMpgs2T3pa0TRr5P7927dW4YF61FIrRNNK7Usr+id/YqXszl4JBFqmtPoOS8+3bVaTd1x6E4wpEVOBkep9Cdd46jVXgO34jBdbd7rmB6s6LRyTKFe+IT9OOXHfI89MJBEesjasZo5NSywPEUJL+nTFkJki8AcNOox0g9dk0a7f95ZvSkxBEucgrociqsj4cVKI2rbqVlHIHNYyTANveGIqsWzO/7uu63UwUQ2iiXIXo/FehbshkHl0Dn6mBmB6pXlBhNxd67I48HhiQE5vBX12zu3KIvSnuKbkOUP0xKVYrS9r1jEzAZLF4dsNAGSiZYFeLb4ZP/nZJMDEhSaBFsY700pR4qxw7aTQrHQP4xb6pUuvp9ogtqr+MFTkNeqFxGW6yJ45wQ+wr4BtJsCFCW3aifoG8hVfdPlQqxIDpSyk27raDYOseMmNtbjdnXQLpeOYFqMVUaLX1oVUKsMNwQSgtGjIWr8T6tGQgYXSSgdp5hf0A63mxe35XJrB86/xHb/Z4tYwSG4duVy/lkXTFTu5jJKPQ/5ykCqq+gcHPzkgK/tQ== tht''
      # "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINMcTaqUZSwv6YW8lx/JhsAZTdNSSC2fR8Pgk8woeFKh vin@scadrial"
    ];
  };

  security.sudo.extraRules = [
    {
      groups = [ "deploy" ];
      commands = [
        {
          command = "/nix/store/*/bin/switch-to-configuration";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/nix-store";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/nix-env";
          options = [ "NOPASSWD" ];
        }
        {
          command = ''/bin/sh -c "readlink -e /nix/var/nix/profiles/system || readlink -e /run/current-system"'';
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/nix-collect-garbage";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}