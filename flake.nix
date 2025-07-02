{
  description = "Local configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    local-modules = {
      url = "path:modules";
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
      home-manager-modules = [ local-modules.homeManagerModules.all ];
    in {

      nixosConfigurations = {
        zalu = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs system home-manager-modules; };
          modules = [
            ./pcs/zalu
            local-modules.nixosModules.default
            local-modules.homeManagerModules.default
          ];
        };

        leano = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs system home-manager-modules; };
          modules = [
            ./pcs/leano
            local-modules.nixosModules.default
            local-modules.homeManagerModules.default
          ];
        };

        H1L0 = {
          inherit system;
          specialArgs = { inherit inputs outputs system home-manager-modules; };
          modules = [
            ./pcs/K1L0
            local-modules.nixosModules.default
            local-modules.homeManagerModules.default
          ];
        };

        halu = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit inputs outputs system home-manager-modules; };

          modules = [
            ./pcs/halu
            nixos-wsl.nixosModules.default
            local-modules.nixosModules.system
            local-modules.homeManagerModules.default
          ];
        };

        mini-pc = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit inputs outputs system home-manager-modules; };

          modules = [
            ./pcs/mini-pc
            local-modules.nixosModules.default
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

        markdown-preview =
          import ./dev-shells/markdown-preview.nix { inherit pkgs; };
      };
    };
}
