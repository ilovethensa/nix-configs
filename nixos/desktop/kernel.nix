{ config, lib, pkgs, modulesPath, ... }:

{
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    extraModprobeConfig = ''
      options kvm_amd nested=1
      options kvm_amd emulate_invalid_guest_state=0
      options kvm ignore_msrs=1
      options snd-aloop index=3
    '';
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
