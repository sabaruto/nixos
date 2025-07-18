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

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.2-1.tar.gz";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    openaws-vpn = {
      url = "github:t-aaronobelley/openaws-vpn-client";
    };

    local-modules = {
      url = "path:modules";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
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
      agenix,
      nixpkgs,
      flake-utils,
      local-modules,
      lix-module,
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
          lix-module.nixosModules.default
          local-modules.nixosModules.default
          local-modules.homeManagerModules.default
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
              agenix.nixosModules.default
              local-modules.nixosModules.default
              local-modules.homeManagerModules.default
            ];
          };

          mini-pc = nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = default-modules + [ ./pcs/mini-pc ];
          };
        };

        devShells."${system}" = {
          saltpay = import ./dev-shells/saltpay.nix { inherit nixpkgs system; };
          streaming-service-merger = import ./dev-shells/streaming-service-merger.nix {
            inherit nixpkgs system;
          };
          zk-app = import ./dev-shells/zk-app.nix { inherit nixpkgs system; };
          nodejs = import ./dev-shells/nodejs.nix { inherit nixpkgs system; };
          openaws-vpn-client = import ./dev-shells/openaws-vpn-client.nix { inherit nixpkgs system; };
        };
      }
    );
}
