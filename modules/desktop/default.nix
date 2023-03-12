{ ... }:
{
  imports =
    [ (import ./hyprland) ] ++
    # [ (import ./eww) ] ++
    [ (import ./package) ] ++
    [ (import ./mako) ] ++
    [ (import ./swaylock) ] ++
    [ (import ./waybar) ] ++
    [ (import ./wofi) ];
}
