{pkgs, ...}:
{
  home.packages = with pkgs;[
    rofi
    feh
    picom
    dunst
    lxappearance
    betterlockscreen
    i3lock-color
    kazam
  ];
}