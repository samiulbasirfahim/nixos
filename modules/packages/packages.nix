{ pkgs
,inputs
, xdg-hyprland
, ...
}: {
  home.packages = with pkgs; [
    grim
    slurp
    libnotify
    swww
    rnix-lsp
    ranger
    ueberzug
    pamixer
    xfce.thunar
    wl-clipboard
    pavucontrol
    wget
    firefox
    wf-recorder
    glib
    vlc
    unzip
    discord
    gparted
    mpv
    wofi
    wlogout
    tty-clock
    playerctl
    qalculate-gtk
    swaylock-effects
    bleachbit
    imv
    libsForQt5.dolphin
    cmatrix
    google-chrome
    shotcut
    cava
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    git
    swww
    git
    htop
    btop
    rofi-wayland
    zoom-us
    xdg-utils
  ];
}
