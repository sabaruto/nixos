{
  description = "Local configuration flake";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=26.05-pre";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    local-modules = {
      url = "path:modules";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
        flake-utils.follows = "flake-utils";
        flake-parts.follows = "flake-parts";
      };
    };

    local-packages = {
      url = "path:packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-wsl,
      flake-utils,
      local-modules,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystemPassThrough (
      system:
      let
        inherit (self) outputs;
        home-manager-modules = [ local-modules.homeManagerModules.all ];
        specialArgs = {
          inherit
            inputs
            outputs
            system
            home-manager-modules
            ;
        };

        default-modules = [
          local-modules.nixosModules.default
          local-modules.homeManagerModules.default
          {
            nixpkgs.overlays = [
              inputs.neovim-nightly-overlay.overlays.default
              inputs.local-packages.overlays.default
            ];
          }
        ];
      in
      {
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
              nixos-wsl.nixosModules.default
              local-modules.nixosModules.system
              local-modules.homeManagerModules.default
              {
                nixpkgs.overlays = [
                  inputs.neovim-nightly-overlay.overlays.default
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
          nodejs = import ./dev-shells/nodejs.nix { inherit nixpkgs system; };
          openaws-vpn-client = import ./dev-shells/openaws-vpn-client.nix {
            inherit nixpkgs system;
          };
        };
      }
    );
}
