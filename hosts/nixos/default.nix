{ lib, username, hostname, pkgs, inputs, config, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    [ (import ./../../modules/packages/python.nix) ];


  # bootloader configuration
  boot.cleanTmpDir = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.plymouth.enable = true;
  boot.plymouth.themePackages = [ pkgs.adi1090x-plymouth ];
  boot.plymouth.theme = "loader_2";


  # basic configuration
  time.timeZone = "Asia/Dhaka";
  i18n.defaultLocale = "en_US.UTF-8";
  sound.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";


  # networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


  # programs
  programs.dconf.enable = true;
  programs.nm-applet.enable = true;
  programs.seahorse.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gtk2";
  };


  # security
  security.sudo.enable = false;
  security.doas.enable = true;
  security.doas.extraRules = [{
    users = [ "fahim" ];
    keepEnv = true;
    persist = true;
  }];


  # hardware configuration
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];


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

  # 
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    desktopManager.xterm.enable = false;
    displayManager = {
      defaultSession = "hyprland";
      sessionPackages = [ inputs.hyprland.packages.${pkgs.system}.default ];
      autoLogin = {
        enable = true;
        user = "fahim";
      };
      gdm = {
        enable = true;
      };
    };
  };


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
    networkmanagerapplet
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
}
