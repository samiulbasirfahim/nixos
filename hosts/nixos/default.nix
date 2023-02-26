{ lib, username, hostname, pkgs, inputs, ... }:

{
  imports =
    [ (import ./plymouth.nix) ] ++
    [ (import ./bootloader.nix) ] ++
    [ (import ./fileSystem.nix) ] ++
    [ (import ./xserver.nix) ] ++
    [ (import ./../../modules/packages/python.nix) ] ++
    [ (import ./hardware.nix) ];

  # basic configuration
  time.timeZone = "Asia/Dhaka";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  i18n.defaultLocale = "en_US.UTF-8";
  sound.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";


  # networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault true;


  # programs
  programs.dconf.enable = true;


  # security
  security.sudo.enable = false;
  security.doas.enable = true;
  security.doas.extraRules = [{
    users = [ "fahim" ];
    keepEnv = true;
    persist = true;
  }];



  # services
  services.getty.autologinUser = "fahim";
  services.gvfs.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.dbus.enable = true;



  # nix setting
  nix.settings.allowed-users = [ "fahim" ];
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 7d";
  # users
  users.users.fahim.isNormalUser = true;
  users.users.fahim.description = "Samiul Basir Fahim";
  users.users.fahim.initialPassword = "rainlover";
  users.users.fahim.extraGroups = [ "networkmanager" "wheel" ];
  users.users.fahim.shell = pkgs.fish;
  security.pam.services.swaylock = { };
  environment.systemPackages = with pkgs; [
    git
    twemoji-color-font
  ];
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      # nerdfonts
      twemoji-color-font
    ];
  };
}
