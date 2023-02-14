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
    atom
    vscode
    neovim
    typescript
    rnix-lsp
    ];
}
