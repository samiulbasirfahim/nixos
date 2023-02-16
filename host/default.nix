{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [
      ./bootloader.nix
      ./hardware.nix
      ./users.nix
      ./network.nix
      ./amd.nix
      ./settings.nix
      ./disks.nix
      ./services.nix
      ./programs.nix
      ./fonts.nix
    ];


  # Set your time zone.
  time.timeZone = "Asia/Dhaka";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  i18n.defaultLocale = "en_US.UTF-8";
  sound.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";
  environment.systemPackages = with pkgs; [
	git
  gnome.seahorse
  ];
}
