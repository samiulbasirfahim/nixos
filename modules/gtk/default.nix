{ config, pkgs, lib, inputs, user, ... }:

{
  imports = [ (import ./themes) ];
  gtk = {
    enable = true;
    font = {
      name = "JetbrainsMono nerd font";
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
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = "Catppuccin-Frappe-Red";
    size = 16;
  };
}
