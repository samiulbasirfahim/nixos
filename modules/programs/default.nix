{...}: 
{
  imports = 
    [(import ./kitty)] ++
    [(import ./neofetch)] ++
    # [(import ./nvim)] ++
    [(import ./fish)] ++
    [(import ./starship)] ++
    [(import ./cava)];
}