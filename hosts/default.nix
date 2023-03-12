{ inputs, nixpkgs, self, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;

in
{
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
      [ (import ./nixos) ] ++
      [
        inputs.hyprland.nixosModules.default
        { programs.hyprland.enable = true; }
      ] ++
      [
        inputs.nur.nixosModules.nur
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            extraSpecialArgs = { inherit inputs; };
            users.fahim = (./home.nix);
          };
          nixpkgs = {
            overlays =
              [
                self.overlays.default
              ];
          };
        }
      ];
  };
}
