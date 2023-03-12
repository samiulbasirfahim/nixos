{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.cleanTmpDir = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.plymouth.enable = true;
  boot.plymouth.themePackages = [ pkgs.adi1090x-plymouth ];
  boot.plymouth.theme = "pixels";

  time.timeZone = "Asia/Dhaka";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;



  programs.dconf.enable = true;
  programs.nm-applet.enable = true;
  programs.seahorse.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gtk2";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };


  security.sudo.enable = false;
  security.doas.enable = true;
  security.pam.services.swaylock = { };
  security.doas.extraRules = [{
    users = [ "fahim" ];
    keepEnv = true;
    persist = true;
  }];



  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];

  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
      twemoji-color-font
    ];
  };
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.getty.autologinUser = "fahim";
  services.gvfs.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.dbus.enable = true;


  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nix.settings.allowed-users = [ "fahim" ];
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 7d";

  users.users.fahim = {
    isNormalUser = true;
    description = "Samiul Basir Fahim";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}
