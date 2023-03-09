{ ... }:
{
  imports =
    [ (import ./hyprland) ] ++
    [ (import ./package) ] ++
    [ (import ./mako) ] ++
    [ (import ./swaylock) ] ++
    [ (import ./waybar) ] ++
    [ (import ./scripts) ] ++
    [ (import ./wofi) ];
}
