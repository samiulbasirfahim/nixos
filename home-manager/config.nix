{
  pkgs,
  ...
}: {
  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  home = {
    username = "fahim";
    homeDirectory = "/home/fahim";
  };
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  gtk = {
    enable = true;
    font.name = "Operator Mono";
    theme.name = "Djancoeg";
    iconTheme.name = "Colloid-dark";
    cursorTheme.name = "Whitesur Cursors";
  };
}
