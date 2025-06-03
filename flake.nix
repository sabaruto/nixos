{
  description = "Local configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    local-nixos = {
      url = "path:modules/nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    local-home-manager = {
      url = "path:modules/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    local-packages = {
      url = "path:packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
    in {

      nixosConfigurations = {
        zalu = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs system; };
          modules = [ ./pcs/zalu ];
        };

        leano = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs system; };
          modules = [ ./pcs/leano ];
        };

        halu = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit inputs outputs system; };

          modules = [ ./pcs/halu nixos-wsl.nixosModules.default ];
        };

        mini-pc = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit inputs outputs system; };

          modules = [ ./pcs/mini-pc ];
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
