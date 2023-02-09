{...}: {
    imports = [
        ./config.nix
        ./packages
        ../dotfiles
        ./shell
        ./neofetch
        ./git.nix
    ];
}
