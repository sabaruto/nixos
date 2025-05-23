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

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, lanzaboote, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
    in rec {

      packages."${system}" = let pkgs = import nixpkgs { inherit system; };
      in { kulala-ls = pkgs.callPackage ./packages/kulala { inherit pkgs; }; };

      nixosModules = {
        default = import ./modules/nixos/default;
        personal = import ./modules/nixos/personal;
        work = import ./modules/nixos/work;
      };

      homeManagerModules = {
        default = import ./modules/home-manager/default;
        personal = import ./modules/home-manager/personal;
        work = import ./modules/home-manager/work;
      };

      nixosConfigurations = {
        zalu = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./pcs/zalu/configuration.nix
            ./pcs/zalu/home.nix
            home-manager.nixosModules.home-manager
            homeManagerModules.default
            homeManagerModules.personal
            lanzaboote.nixosModules.lanzaboote
            nixosModules.default
            nixosModules.personal
          ];
        };

        leano = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit inputs outputs system; };

          modules = [
            ./pcs/leano/configuration.nix
            ./pcs/leano/home.nix
            home-manager.nixosModules.home-manager
            homeManagerModules.default
            homeManagerModules.personal
            lanzaboote.nixosModules.lanzaboote
            nixosModules.default
            nixosModules.personal
          ];
        };

        halu = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit inputs outputs system; };

          modules = [
            ./pcs/halu/configuration.nix
            ./pcs/halu/home.nix
            home-manager.nixosModules.home-manager
            homeManagerModules.default
            nixos-wsl.nixosModules.default
            nixosModules.default
            nixosModules.work
          ];
        };
      };

      homeConfigurations = {
        theodore = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs outputs; };
          pkgs = nixpkgs.legacyPackages."${system}";
          modules = [ ./users/theodore/home.nix ];
        };

        dosia = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."${system}";
          extraSpecialArgs = { inherit inputs outputs; };

          modules = [ ./users/dosia/home.nix ];
        };
      };

      devShells."${system}" = {
        default =
          import ./dev-shells { pkgs = import nixpkgs { inherit system; }; };
        ssm = import ./dev-shells/streaming-service-merger.nix {
          pkgs = import nixpkgs { inherit system; };
        };

        payments-gateway-service =
          import ./dev-shells/payments-gateway-service.nix {
            pkgs = import nixpkgs { inherit system; };
          };
      };
    };
}
