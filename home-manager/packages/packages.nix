{
    pkgs,
    xdg-hyprland,
    ...
} : {
    home.packages = with pkgs; [
    grim
    slurp
    libnotify
    swaybg
    kitty
    rofi
    dunst
    rnix-lsp
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
    ];
}
