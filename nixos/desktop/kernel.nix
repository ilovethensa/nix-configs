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
  /* boot.kernelPatches = [
       {
         name = "Clear linux patches";
         patch = ./patches/kernel/0001-clear-patches.patch;
       }
       {
         name = "soft redflag";
         patch = ./patches/kernel/0002-mm-Support-soft-dirty-flag-read-with-reset.patch;
       }
           {
         name = "Glitched base";
         patch = ./patches/kernel/0003-glitched-base.patch;
       }
       {
         name = "iommu";
         patch = ./patches/kernel/0006-add-acs-overrides_iommu.patch;
       }
           {
         name = "fsync";
         patch = ./patches/kernel/0007-v6.6-fsync1_via_futex_waitv.patch;
       }
           {
         name = "winesync";
         patch = ./patches/kernel/0007-v6.6-winesync.patch;
       }
           {
         name = "bcachefs";
         patch = ./patches/kernel/0008-6.6-bcachefs.patch;
       }
           {
         name = "misc";
         patch = ./patches/kernel/0012-misc-additions.patch;
       }
           {
         name = "optimize harder";
         patch = ./patches/kernel/0013-optimize_harder_O3.patch;
       }
           {
         name = "OpenRGB";
         patch = ./patches/kernel/0014-OpenRGB.patch;
       }
     ];
  */
}
