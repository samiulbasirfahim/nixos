{...}: 
{
  imports =
    [(import ./hyprland)] ++
    [(import ./mako)] ++
    [(import ./waybar)] ++
    [(import ./wofi)] ++
    [(import ./variables.nix)];
  home.file.".config/wlogout/layout".source = ./wlogout/layout;
}
