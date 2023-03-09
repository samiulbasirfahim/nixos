{ pkgs, ... }:


let
  dbus-hyprland-environment = pkgs.writeTextFile {
    name = "dbus-hyprland-environment";
    destination = "/bin/dbus-hyprland-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };
  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    doas nixos-rebuild switch --flake $HOME/Flakes/.#nixos
  '';
  wall-change = pkgs.writeShellScriptBin "wall-change" ''
    swww img $1 --transition-type random --transition-pos "$(hyprctl cursorpos)" --transition-duration 3
  '';
in
{
  home.file.".local/bin/toggle_sound_output".source = ./toggle_sound_output;
  home.file.".local/bin/toggle_hyprland_layout".source = ./toggle_hyprland_layout;
  home.packages = with pkgs; [
    rebuild
    wall-change
    dbus-hyprland-environment
  ];
}
