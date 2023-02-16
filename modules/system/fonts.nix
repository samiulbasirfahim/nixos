{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # twemoji-color-font
  ];
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      # nerdfonts
    ];
  };

}
