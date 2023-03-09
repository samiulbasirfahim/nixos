{ hostname, ... }: {
  programs.fish = {
    # loginShellInit = ''
    #   # set TTY1 (tty)
    #   # [ "$TTY1" = "/dev/tty1" ] && exec dbus-run-session sway --unsupported-gpu
    #   set TTY1 (tty)
    #   [ "$TTY1" = "/dev/tty1" ] && exec dbus-run-session Hyprland
    # '';
    enable = true;
    shellAliases = {
      cleanup = "nix-collect-garbage && nix-collect-garbage -d && doas nix-collect-garbage && doas nix-collect-garbage -d && doas rm /nix/var/nix/gcroots/auto/*";
      n = "clear && neofetch";
      v = "nvim";
      record = "wf-recorder -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
    };

  };
}
