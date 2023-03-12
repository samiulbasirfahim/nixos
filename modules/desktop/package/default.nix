{ pkgs, inputs, ... }:
{
  home.packages = with pkgs;[
    wofi
    swww
    wlogout
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    swaylock-effects
    wofi
    wlogout
    grim
    slurp
    wl-clipboard
    wf-recorder
    glib
    wayland
    swayidle
    lxappearance
    direnv
  ];
}
