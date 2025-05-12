{
  description = "Local configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      lanzaboote,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosModules.default = import ./modules/nixos;
      nixDarwinModules.default = import ./modules/nix-darwin;
      homeManagerModules = {
        default = import ./modules/home-manager;
      };

      nixosConfigurations = {
        zalu = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            home-manager.nixosModules.home-manager
            lanzaboote.nixosModules.lanzaboote
            ./pcs/zalu/configuration.nix
            ./pcs/zalu/home.nix
          ];
        };

        leano = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs system; };

          modules = [
            home-manager.nixosModules.home-manager
            lanzaboote.nixosModules.lanzaboote
            ./pcs/leano/configuration.nix
            ./pcs/leano/home.nix
          ];
        };
      };

      darwinConfigurations = {
        malu = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs outputs; };

          modules = [
            home-manager.darwinModules.home-manager
            ./pcs/malu/configuration.nix
            ./pcs/malu/home.nix
          ];
        };
      };

      homeConfigurations = {
        theodore = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs outputs; };
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./users/theodore/home.nix ];
        };

        dosia = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };

          modules = [ ./users/dosia/home.nix ];
        };
      };

      devShells."x86_64-linux" = {
        ssm = import ./dev-shells/streaming-service-merger.nix {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        };
      };
    };
}
