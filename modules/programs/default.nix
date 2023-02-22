{...}: 
{
  imports = 
    [(import ./kitty)] ++
    [(import ./neofetch)] ++
    [(import ./neovim)] ++
    [(import ./fish)] ++
    [(import ./starship)] ++
    [(import ./cava)];
}