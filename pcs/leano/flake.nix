{
  description = "Leano PC Flake";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs?ref=nixos-unstable;
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@attrs: 
  let
    user = "dosia";
    environment = "ssm";
  in
  {
    nixosConfigurations.leano = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ({ config, pkgs, ... }: { 
        	networking.hostName = "leano";
        	system.stateVersion = "24.11";

			# Environment session Variables
        	environment.sessionVariables = {
        		WLR_NO_HARDWARE_CURSORS = "1";
        		NIXOS_OZONE_WL = "1";
        	};
        })

        ../base.nix

        # Include the results of the hardware scan.
        ./hardware.nix

        # Desktop Environment
        ../../desktop-environment/kde.nix

        # Dev Environment
        ../../environments/${environment}/configuration.nix

        # Leano uses a nvidia GPU
        ../gpu/nvidia.nix

        ../../home-manager/${user}/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.${user} = (
            { config, pkgs, ... }:
            {
              imports = [
                ../../home-manager/${user}/home.nix
                ../../environments/${environment}/home.nix
              ];
            }
          );
        }
      ];
    };
  };
}
