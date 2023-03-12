{...}: 
{
  imports = 
    [(import ./kitty)] ++
    [(import ./neofetch)] ++
    [(import ./fish)] ++
    # [(import ./nvim)] ++
    [(import ./starship)] ++
    [(import ./cava)];
}