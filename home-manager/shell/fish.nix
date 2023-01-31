{ ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      dotfiles = "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
      update-home = "home-manager switch --flake $HOME/.config/nixos/.#fahim@nixos";
      update-nixos = "sudo nixos-rebuild switch --flake $HOME/.config/nixos/.#nixos";
      n = "clear && neofetch";
      v = "nvim";
      p = "python3";
      cleanup = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && nix-collect-garbage -d";
      record = "wf-recorder -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
    };
  };
}
