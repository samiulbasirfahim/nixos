{...}: {
  xdg.configFile = {
      "hypr".source = ./hyprland;
      "rofi".source = ./rofi;
      "waybar".source = ./waybar;
      "nvim".source = ./neovim;
      "kitty".source = ./kitty;
      "dunst".source = ./dunst;
  };
  xdg.dataFile = {
      "fonts".source = ./fonts;
      "themes".source = ./themes;
  };
}
