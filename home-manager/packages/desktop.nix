{ inputs, lib, config, pkgs, ... }: {
imports = [
    inputs.hyprland.homeManagerModules.default
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = false;
    systemdIntegration = true;
  };
  programs.waybar = {
    enable = true;
  };
programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
  });
}
