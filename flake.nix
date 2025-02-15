{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs?ref=nixos-unstable;
  };

  outputs = { self, nixpkgs }@attrs: {
    nixosConfigurations.leano = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ 
        # Include the results of the hardware scan.
        ./hardware-configuration.nix

        ./configuration.nix
      ];
    };
  };
}
