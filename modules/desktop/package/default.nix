{ pkgs, inputs, ... }:
{
  home.packages = with pkgs;[
    wofi
    wlogout
    swww
    mako
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
  ];
}
