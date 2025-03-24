{
  description = "Local configuration flake";

  inputs = {
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        zalu = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";

          specialArgs = {
            inherit inputs;
            username = "dosia";
            hostname = "zalu";
            stateVersion = "25.05";
          };

          modules = [
            # configurations entrypoint
            ./base.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users."${specialArgs.username}" = import ./home.nix;

                backupFileExtension = "backup";
                extraSpecialArgs = specialArgs;
              };
            }
          ];
        };

        leano = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";

          specialArgs = {
            inherit inputs;
            username = "dosia";
            hostname = "leano";
            stateVersion = "24.11";
          };

          modules = [
            # configurations entrypoint
            ./base.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users."${specialArgs.username}" = import ./home.nix;

                backupFileExtension = "backup";
                extraSpecialArgs = specialArgs;
              };
            }
          ];
        };
      };
    };
}
