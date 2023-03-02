{
    pkgs,
    ...
} : {
    home.packages = with pkgs; [
    nodejs
    nodePackages.nodemon
    yarn
    gcc
    nix-prefetch-github
    vscode
    # neovim
    typescript
    rnix-lsp
    # rust
    ];
}
