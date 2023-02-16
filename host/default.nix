{ inputs
, hyprland
, home-manager
, ...
}: {
  imports = [
    ../modules/system
    home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.fahim = (../home-manager);
  };
}
