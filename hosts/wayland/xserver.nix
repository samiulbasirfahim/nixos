{ inputs,pkgs,username, ... }:

{
  # xserver configuration
  services.xserver = {
    displayManager = {
      defaultSession = "hyprland";
      sessionPackages = [ inputs.hyprland.packages.${pkgs.system}.default ];
    };
  };
}
