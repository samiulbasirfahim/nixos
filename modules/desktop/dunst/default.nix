{...}: {
  services.dunst.enable = true;
  xdg.configFile."dunst".source = ./config;
}