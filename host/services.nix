{
    pkgs,
    ...
} : {
    services = {
        getty.autologinUser = "fahim";
        gvfs.enable = true;
        gnome = {
            gnome-keyring.enable = true;
        };
        dbus.enable = true;
        dbus.packages = [
            pkgs.gnome.seahorse
        ];
    };
}
