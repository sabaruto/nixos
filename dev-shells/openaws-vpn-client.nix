{ nixpkgs, system }:
let
  pkgs = import nixpkgs { inherit system; };
in
with pkgs;
mkShell {
  packages = [
    gtk3
    cairo
    glib
    pkg-config
  ];
}
