{ nixpkgs, system }:
let
  pkgs = import nixpkgs { inherit system; };
in
with pkgs;
mkShell {
  packages = [
    nodejs_24
  ];
}
