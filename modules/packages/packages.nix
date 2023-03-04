{ pkgs
, inputs
, xdg-hyprland
, ...
}: {
  home.packages = with pkgs; [
    libnotify
    rnix-lsp
    ranger
    ueberzug
    pamixer
    xfce.thunar
    pavucontrol
    firefox
    glib
    vlc
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
  ];
}
