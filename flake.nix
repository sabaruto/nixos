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
