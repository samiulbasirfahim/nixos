{ pkgs, ... }:


let
  my-swaylock = pkgs.writeShellScriptBin "my-swaylock" ''
    swaylock  \
          --screenshots \
          --clock \
          --indicator \
          --indicator-radius 100 \
          --indicator-thickness 7 \
          --effect-blur 7x5 \
          --effect-vignette 0.5:0.5 \
          --ring-color 3b4252 \
          --key-hl-color 880033 \
          --line-color 00000000 \
          --inside-color 00000088 \
          --separator-color 00000000 \
          --fade-in 0.3 && notify-send "Hey Fahim, Welcome back"
  '';
  wall-change = pkgs.writeShellScriptBin "wall-change" ''
    swww img $1 --transition-type random --transition-pos "$(hyprctl cursorpos)" --transition-duration 3
  '';
in
{
  home.file.".local/bin/toggle-sound-output".source = ./toggle-sound-output;
  home.packages = with pkgs; [
    wall-change
    my-swaylock
  ];
}
