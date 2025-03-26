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
      self,
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let inherit (self) outputs; in
    {
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

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

        leano = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };

          modules = [
            # configurations entrypoint
            ./pcs/leano/configuration.nix
            ./pcs/leano/global-configuration.nix
          ];
        };
      };
      homeConfigurations = {
        theodore = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            nixvim.homeManagerModules.nixvim
            ../packages/nvim.nix
           ./home.nix
          ];
        };

        dosia = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };

          modules = [
            nixvim.homeManagerModules.nixvim
            ./home-manager/dosia/home.nix
          ];
        };
      };
    };
}
