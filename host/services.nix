{
    pkgs,
    ...
} : {
    services = {
        gvfs.enable = true;
        gnome = {
            gnome-keyring.enable = true;
        };
    };
}
