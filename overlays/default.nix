{ inputs, outputs, ... }:
{
  additions = final: prev: import ../pkgs {
    pkgs = final;
  };

  xdg-desktop-portal-hyprland = inputs.xdg-desktop-portal-hyprland.overlays.default;
}