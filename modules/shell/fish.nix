{ ... }: {
  programs.fish = {
    enable = true;
    loginShellInit = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec dbus-run-session Hyprland
    '';
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake $HOME/.config/nixos/.#nixos";
      n = "clear && neofetch";
      v = "nvim";
      record = "wf-recorder -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
    };
    
  };
}
