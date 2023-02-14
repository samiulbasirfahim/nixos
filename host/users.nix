{
    pkgs,
    ...
} : {
    users.users.fahim = {
        isNormalUser = true;
        description = "Samiul Basir Fahim";
        initialPassword = "rainlover";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
        packages = with pkgs; [
        ];
    };
}
