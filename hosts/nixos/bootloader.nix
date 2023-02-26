{ pkgs, ... }:

{
  # bootloader configuration
  boot.cleanTmpDir = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
}
