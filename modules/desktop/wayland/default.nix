{ ... }:
{
  imports =
    [ (import ./hyprland) ] ++
    [ (import ./package) ] ++
    [ (import ./mako) ] ++
    [ (import ./waybar) ] ++
    [ (import ./scripts) ] ++
    [ (import ./wofi) ] ++
    [ (import ./variables.nix) ];
  home.file.".config/wlogout/layout".source = ./wlogout/layout;
}
