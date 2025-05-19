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
    let inherit (self) outputs;
    in rec {
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
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            home-manager.nixosModules.home-manager
            lanzaboote.nixosModules.lanzaboote
            nixosModules.default
            nixosModules.personal
            homeManagerModules.default
            homeManagerModules.personal
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
            nixosModules.default
            nixosModules.personal
            homeManagerModules.default
            homeManagerModules.personal
            ./pcs/leano/configuration.nix
            ./pcs/leano/home.nix
          ];
        };

        halu = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs system; };

          modules = [
            home-manager.nixosModules.home-manager
            nixos-wsl.nixosModules.default
            nixosModules.default
            nixosModules.work
            homeManagerModules.default
            ./pcs/halu/configuration.nix
            ./pcs/halu/home.nix
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
        default = import ./dev-shells {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        };
        ssm = import ./dev-shells/streaming-service-merger.nix {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        };

        payments-gateway-service =
          import ./dev-shells/payments-gateway-service.nix {
            pkgs = import nixpkgs { system = "x86_64-linux"; };
          };
      };
    };
}
