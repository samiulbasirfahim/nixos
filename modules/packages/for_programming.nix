{
    pkgs,
    ...
} : {
    home.packages = with pkgs; [
    nodejs
    nodePackages.nodemon
    python39
    yarn
    gcc
    nix-prefetch-github
    vscode
    neovim
    typescript
    rnix-lsp
    ];
}
