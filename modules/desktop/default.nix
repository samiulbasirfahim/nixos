{...}: 
{
  imports =
    [(import ./hyprland)] ++
    [(import ./dunst)] ++
    [(import ./waybar)] ++
    [(import ./wofi)] ++
    [(import ./variables.nix)];
}