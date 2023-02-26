{ username, hostname, inputs, self, nixpkgs, ... }:

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
    specialArgs = { inherit self inputs username; };
    modules = [ (import ./nixos) ] ++
      [
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            extraSpecialArgs = { inherit inputs username; };
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
