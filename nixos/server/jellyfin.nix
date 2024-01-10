{ pkgs, lib, config, ... }: {
  # Enable vaapi on OS-level
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = [
      pkgs.intel-media-driver
      pkgs.vaapiIntel
      pkgs.vaapiVdpau
      pkgs.libvdpau-va-gl
    ];
  };

  # Allow jellyfin user to access the graphics card
  users.users.${config.services.jellyfin.user}.extraGroups =
    [ "video" "render" ];

  # Override default hardening measure from NixOS
  systemd.services.jellyfin.serviceConfig.PrivateDevices = lib.mkForce false;
  systemd.services.jellyfin.serviceConfig.DeviceAllow =
    lib.mkForce [ "/dev/dri/renderD128" ];

  # 2. do not forget to enable jellyfin
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
}
