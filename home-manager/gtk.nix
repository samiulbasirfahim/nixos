{
  pkgs,
  ...
}: {
    gtk = {
    enable = true;
    font.name = "Operator Mono";
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    theme = {
      name = "Djancoeg"; 
    };
  };
}