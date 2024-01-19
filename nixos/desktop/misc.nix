{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1"; # Enable ROCM on my RX 580
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };
  systemd = {
    oomd.enable = false;
    tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
  };
  hardware.opengl = {
    driSupport = true; # This is already enabled by default
    driSupport32Bit = true; # For 32 bit applications
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
    ]; # For hashcat
  };

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
    magicOrExtension = "\\x7fELF....AI\\x02";
  };
  environment.systemPackages = [
    comma
  ];
}
