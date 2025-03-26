{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: {
    homeConfigurations = {
      theodore = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          nixvim.homeManagerModules.nixvim
          ../packages/nvim.nix
          ./home.nix
        ];
      };
      dosia = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x68_64-linux;
        modules = [
          nixvim.homeManagerModules.nixvim
          ./home.nix
        ];
      };
    };
  };
}
