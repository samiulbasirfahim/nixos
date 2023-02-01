{
    pkgs,
    ...
} : {
    home.packages = with pkgs; [
    nodejs
    python39
    yarn
    gcc
    nix-prefetch-github
    vscode
    neovim
    neovide
    ];
}
