{ pkgs, ... }:


let
  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    doas nixos-rebuild switch --flake $HOME/Flakes/.#nixos
  '';
  wall-change = pkgs.writeShellScriptBin "wall-change" ''
    swww img $1 --transition-type random --transition-pos "$(hyprctl cursorpos)" --transition-duration 3
  '';
in
{
  home.file.".local/bin/toggle_sound_output".source = ./toggle_sound_output;
  home.file.".local/bin/toggle_hyprland_layout".source = ./toggle_hyprland_layout;
  home.packages = with pkgs; [
    rebuild
    wall-change
  ];
}
