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
            sddm = {
                enable = true; 
            };
        };
    };
}
