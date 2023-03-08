{ hostname,... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      cleanup = "nix-collect-garbage && nix-collect-garbage -d && doas nix-collect-garbage && doas nix-collect-garbage -d && doas rm /nix/var/nix/gcroots/auto/*";
      n = "clear && neofetch";
      v = "nvim";
      record = "wf-recorder -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
    };
    
  };
}
