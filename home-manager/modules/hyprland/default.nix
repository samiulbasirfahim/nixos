{inputs, ...} : {

  imports = [
    inputs.hyprland.homeManagerModules.default
  ];
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec  Hyprland
        fi
      '';
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
  };
  xdg.configFile."hypr".source = ./config;
}
