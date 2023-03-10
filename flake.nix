{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    hyprland = {
      url = "github:hyprwm/hyprland/v0.20.1beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nur, ... }@inputs:
    let
      username = "fahim";
      hostname = "nixos";
      selfPkgs = import ./pkgs;
    in
    {
      overlays.default = selfPkgs.overlay;
      nixosConfigurations = (
        import ./hosts {
          inherit self inputs nixpkgs username hostname nur;
        }
      );
    };
}
