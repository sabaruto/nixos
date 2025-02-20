{
  description = "Leano PC Flake";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs?ref=nixos-unstable;
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@attrs: {
    nixosConfigurations.leano = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ({ config, pkgs, ... }: { networking.hostName = "leano"; })

        ../base.nix

        # Include the results of the hardware scan.
        ./hardware.nix

        # Desktop Environment
        ../../desktop-environment/gnome.nix

        # Leano uses a nvidia GPU
        ../gpu/nvidia.nix

        ../../home-manager/dosia/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.dosia = import ../../home-manager/dosia/home.nix;
        }
      ];
    };
  };
}
