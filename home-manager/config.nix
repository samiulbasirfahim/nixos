{
  pkgs,
  ...
}: {
  home = {
    username = "fahim";
    homeDirectory = "/home/fahim";
  };
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
