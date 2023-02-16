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
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = true;
                  extraSpecialArgs = { inherit inputs; };
                  # Home manager config (configures programs like firefox, zsh, eww, etc)
                  users.fahim = (./. + "/home-manager");
              };
              # nixpkgs.overlays = [
              #     # Add nur overlay for Firefox addons
              #     nur.overlay
              #     (import ./overlays)
              # ];
            }
          ];
        };
      };
    };
}
