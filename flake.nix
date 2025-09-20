{
  description = "Local configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    local-modules = {
      url = "path:modules";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
        flake-utils.follows = "flake-utils";
      };
    };

    local-packages = {
      url = "path:packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, agenix, nixpkgs, nixos-wsl, flake-utils, local-modules, ...
    }@inputs:
    flake-utils.lib.eachDefaultSystemPassThrough (system:
      let
        inherit (self) outputs;
        home-manager-modules = [ local-modules.homeManagerModules.all ];
        specialArgs = { inherit inputs outputs system home-manager-modules; };

        default-modules = [
          local-modules.nixosModules.default
          local-modules.homeManagerModules.default
          {
            nixpkgs.overlays = [
              inputs.neovim-nightly-overlay.overlays.default
              inputs.local-modules.overlays.default
              inputs.local-packages.overlays.default
            ];
          }
        ];
      in {
        nixosConfigurations = {
          zalu = nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = default-modules ++ [ ./pcs/zalu ];
          };

          leano = nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = default-modules ++ [ ./pcs/leano ];
          };

          K1L0 = nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = default-modules ++ [ ./pcs/K1L0 ];
          };

          halu = nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
              ./pcs/halu
              agenix.nixosModules.default
              nixos-wsl.nixosModules.default
              local-modules.nixosModules.system
              local-modules.homeManagerModules.default
              {
                nixpkgs.overlays = [
                  inputs.neovim-nightly-overlay.overlays.default
                  inputs.local-modules.overlays.default
                  inputs.local-packages.overlays.default
                ];
              }
            ];
          };

          mini-pc = nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = default-modules ++ [ ./pcs/mini-pc ];
          };
        };

        devShells."${system}" = {
          saltpay = import ./dev-shells/saltpay.nix { inherit nixpkgs system; };
          streaming-service-merger =
            import ./dev-shells/streaming-service-merger.nix {
              inherit nixpkgs system;
            };
          nodejs = import ./dev-shells/nodejs.nix { inherit nixpkgs system; };
          openaws-vpn-client = import ./dev-shells/openaws-vpn-client.nix {
            inherit nixpkgs system;
          };
        };
      });
}
