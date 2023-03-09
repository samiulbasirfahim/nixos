{ pkgs, ... }:


let
  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    doas nixos-rebuild switch --flake $HOME/Flakes/.#nixos
  '';
in
{
  home.file.".local/bin/toggle_sound_output".source = ./toggle_sound_output;
  home.packages = with pkgs; [
    rebuild
  ];
}
