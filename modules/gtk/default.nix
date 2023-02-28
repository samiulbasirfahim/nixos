{ config, pkgs, lib, inputs, user, ... }:

{
  imports = [ (import ./themes) ];
  gtk = {
    enable = true;
    font = {
      name = "Operator Mono Book";
      size = 11;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    theme = {
      name = "Djancoeg";
    };
    cursorTheme = {
      name = "Catppuccin-Frappe-Dark";
    };
  };
  home.file.".local/share/fonts/OperatorMono-Bold.otf".source = ./fonts/OperatorMono-Bold.otf;
  home.file.".local/share/fonts/OperatorMono-Book.otf".source = ./fonts/OperatorMono-Book.otf;
  home.file.".local/share/fonts/OperatorMonoLig-MediumItalic.otf".source = ./fonts/OperatorMonoLig-MediumItalic.otf;
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = "Catppuccin-Frappe-Red";
    size = 16;
  };
}
