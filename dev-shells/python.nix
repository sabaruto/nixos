{ nixpkgs, system }:
let
  pkgs = import nixpkgs { inherit system; };
in
with pkgs;
mkShell {
  packages =
    [
      python3Full
      pyright
      mypy
    ]
    ++ (with python313Packages; [
      click
      requests
      pyjwt
      cryptography
    ]);
}
