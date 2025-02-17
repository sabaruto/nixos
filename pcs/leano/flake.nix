{
  description = "Leano PC Flake";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs?ref=nixos-unstable;
  };

  outputs = { self, nixpkgs }@attrs: {
    nixosConfigurations.leano = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ({ config, pkgs, ... }: { networking.hostName = "leano"; })

        ../base.nix

        # Include the results of the hardware scan.
        ./hardware.nix

        # Leano uses a nvidia GPU
        ../gpu/nvidia.nix

        # Adds Dosia as the default user
        ../../users/dosia.nix
      ];
    };
  };
}
