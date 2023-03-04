{ username, hostname, inputs, self, nixpkgs, nur, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;

in
{
  wayland = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };
    modules = [ (import ./system.nix) ] ++
      [ (import ./wayland/xserver.nix) ] ++
      [
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            extraSpecialArgs = { inherit inputs username; };
            users.fahim = (./wayland/home.nix);
          };
          nixpkgs = {
            overlays =
              [
                self.overlays.default
                nur.overlay
              ];
          };
        }
      ];
  };
  xorg = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username; };
    modules = [ (import ./system.nix) ] ++
      [ (import ./xorg/xserver.nix) ] ++
      [
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            extraSpecialArgs = { inherit inputs username; };
            users.fahim = (./xorg/home.nix);
          };
          nixpkgs = {
            overlays =
              [
                self.overlays.default
                nur.overlay
              ];
          };
        }
      ];
  };
}
