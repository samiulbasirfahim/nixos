{
    pkgs,
    ...
} : {
    users.users.fahim = {
        isNormalUser = true;
        description = "Samiul Basir Fahim";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
        packages = with pkgs; [
        ];
    };
}

