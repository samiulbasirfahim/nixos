{
    lib,
    ...
} : {
    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
        useDHCP = lib.mkDefault true;
    };
}
