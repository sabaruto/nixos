{
  description = "Local packages flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { nixpkgs, ... }:
    let system = "x86_64-linux";
    in {
      packages."${system}" = let pkgs = import nixpkgs { inherit system; };
      in { kulala-ls = pkgs.callPackage ./kulala { inherit pkgs; }; };
    };
}
