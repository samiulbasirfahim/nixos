{ pkgs, ... }:


let
  rebuild-xorg = pkgs.writeShellScriptBin "rebuild-xorg" ''
    doas nixos-rebuild switch --flake $HOME/NixOS/.#xorg
  '';
  rebuild-wayland = pkgs.writeShellScriptBin "rebuild-wayland" ''
    doas nixos-rebuild switch --flake $HOME/NixOS/.#wayland
  '';
in
{
  home.file.".local/bin/toggle_sound_output".source = ./toggle_sound_output;
  home.packages = with pkgs; [
    rebuild-wayland
    rebuild-xorg
  ];
}
