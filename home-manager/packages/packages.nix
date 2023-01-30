{
    pkgs,
    xdg-hyprland,
    ...
}: {
    home.packages = with pkgs; [
    lxappearance
    neovim
    swaybg
    kitty
    rofi
    wlogout
    rnix-lsp
    pamixer
    xfce.thunar
    gcc
    python39
    nodejs
    ffmpeg
    obs-studio
    xdg-hyprland.packages.${pkgs.system}.hyprland-share-picker
    xclip
    wl-clipboard
    ];
}
