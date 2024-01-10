{ config, lib, pkgs, modulesPath, ... }:

{
  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";  # Enable ROCM on my RX 580
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware.opengl.driSupport = true; # This is already enabled by default
  hardware.opengl.driSupport32Bit = true; # For 32 bit applications
  hardware.opengl.extraPackages = with pkgs; [ rocm-opencl-icd rocm-opencl-runtime ]; # For hashcat
}