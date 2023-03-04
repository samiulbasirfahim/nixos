{ inputs, pkgs, username, ... }:

{
  # xserver configuration
  services.xserver = {
    windowManager.i3.enable = true;
    windowManager.i3.package = pkgs.i3-gaps;
    displayManager = {
      defaultSession = "none+i3";
    };
  };
  environment.systemPackages = with pkgs; [
    polybar
  ];
}
