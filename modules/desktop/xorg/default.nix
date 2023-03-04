{...}: 
{
  imports =
    [(import ./package)] ++
    [(import ./picom)] ++
    [(import ./i3wm)];
  home.file.".config/polybar/config.ini".source = ./polybar/config.ini;
}
