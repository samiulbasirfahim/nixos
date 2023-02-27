{ config, pkgs, lib, inputs, user, ... }:

{
  imports = [ ( import ./themes ) ];
  home.file.".local/share/fonts/OperatorMono-Bold.otf".source = ./fonts/OperatorMono-Bold.otf;
  home.file.".local/share/fonts/OperatorMono-Book.otf".source = ./fonts/OperatorMono-Book.otf;
  home.file.".local/share/fonts/OperatorMonoLig-MediumItalic.otf".source = ./fonts/OperatorMonoLig-MediumItalic.otf;
  home.sessionVariables = {
    GTK_THEME = "Catpuccin";
  };
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = "Catppuccin-Frappe-Red";
    size = 16;
  };
  home.pointerCursor.gtk.enable = true;
  gtk = {
    enable = true;
    theme = {
      name = "Djancoeg";
    };
    cursorTheme = {
      name = "Catppuccin-Frappe-Dark";
    };
    iconTheme = {
      name = "Papirus-Light";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "Operator Mono Book";
      size = 11;
    };
    # gtk3.extraConfig = {
    #   gtk-xft-antialias = 1;
    #   gtk-xft-hinting = 1;
    #   gtk-xft-hintstyle = "hintslight";
    #   gtk-xft-rgba = "rgb";
    # };
    # gtk2.extraConfig = ''
    #   gtk-xft-antialias=1
    #   gtk-xft-hinting=1
    #   gtk-xft-hintstyle="hintslight"
    #   gtk-xft-rgba="rgb"
    # '';
  };
}
