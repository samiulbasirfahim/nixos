{
  pkgs,
  ...
}: {
    gtk = {
    enable = true;
    font.name = "Operator Mono";
    iconTheme.name = "Papirus-Dark";
    iconTheme.package = pkgs.papirus-icon-theme;
    theme.name = "Djancoeg";
  };
}