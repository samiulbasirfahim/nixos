{
    inputs,
    pkgs,
    ...
} : {
    services.xserver = {
        enable = true;
        videoDrivers = ["amdgpu"];
        displayManager = {
            defaultSession = "hyprland";
            sessionPackages = [ inputs.hyprland.packages.${pkgs.system}.default ];
            autoLogin = {
                enable = true;
                user = "fahim";
            };
            lightdm = {
                enable = true;
            };
        };
    };
}
