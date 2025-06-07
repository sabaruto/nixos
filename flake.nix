{
  description = "Local configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    local-modules = {
      url = "path:nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    local-packages = {
      url = "path:packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, local-modules, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
    in {

      nixosConfigurations = {
        zalu = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs outputs system;
            home-manager-modules = [ local-modules.homeManagerModules.all ];
          };
          modules = [
            ./pcs/zalu
            local-modules.nixosModules.default
            local-modules.homeManagerModules.default
          ];
        };

        leano = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs outputs system;
            home-manager-modules = [ local-modules.homeManagerModules.all ];
          };
          modules = [
            ./pcs/leano
            local-modules.nixosModules.default
            local-modules.homeManagerModules.default
          ];
        };

        halu = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit inputs outputs system;
            home-manager-modules = [ local-modules.homeManagerModules.all ];
          };

          modules = [
            ./pcs/halu
            nixos-wsl.nixosModules.default
            local-modules.nixosModules.system
            local-modules.homeManagerModules.default
          ];
        };

        mini-pc = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit inputs outputs system;
            home-manager-modules = [ local-modules.home-manager-modules.all ];
          };

          modules = [
            ./pcs/mini-pc
            local-modules.nixosModules.system
            local-modules.homeManagerModules.default
          ];
        };
      };

      devShells."${system}" = let pkgs = import nixpkgs { inherit system; };
      in {
        saltpay = import ./dev-shells/saltpay.nix { inherit pkgs; };

        streaming-service-merger =
          import ./dev-shells/streaming-service-merger.nix { inherit pkgs; };

        mini-pc = import ./dev-shells/mini-pc.nix { inherit pkgs; };

        terminal-scripts =
          import ./dev-shells/terminal-scripts.nix { inherit pkgs; };
      };
    };
}
