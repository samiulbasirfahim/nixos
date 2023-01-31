{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/hyprland/v0.20.1beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xdg-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
  };

  outputs = {self, nixpkgs, hyprland, home-manager, xdg-hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit self inputs; };
          modules = [
          hyprland.nixosModules.default
            ./host
          ];
        };
      };
      homeConfigurations = {
        "fahim@nixos" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs self xdg-hyprland; };
          modules = [ 	            
            ./home-manager
            ];
        };
      };
    };
}
