{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, hyprland,self, ...}@inputs: 
  let 
    selfPkgs = import ./pkgs;
  in
  { 
    import = [
      ./overlays/nur.nix
    ];
    overlays.default = selfPkgs.overlay;
    nixosConfigurations = (import ./hosts {
          inherit self inputs nixpkgs;
        }
      );
  };
}