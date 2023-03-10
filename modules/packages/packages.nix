{ pkgs, inputs, ... }:


{
  home.packages = (with pkgs; [
    # nur.repos.mic92.hello-nur
    libnotify
    rnix-lsp
    ranger
    ueberzug
    pamixer
    xfce.thunar
    pavucontrol
    wget
    unzip
    discord
    gparted
    mpv
    tty-clock
    playerctl
    qalculate-gtk
    bleachbit
    imv
    libsForQt5.dolphin
    cmatrix
    google-chrome
    shotcut
    cava
    git
    htop
    zoom-us
    xdg-utils
    # microsoft-edge
  ]);
}
