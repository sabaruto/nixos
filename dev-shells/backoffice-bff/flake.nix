{
  description = "Backoffice bff flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystemPassThrough (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        buildNodeJs = pkgs.callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" {
          python = pkgs.python3;
        };

        nodejs = buildNodeJs {
          enableNpm = true;
          version = "22.15.1";
          sha256 = "sha256-wZ8Bd9IcYhdGYl5fN1kL0NeacgQ7d7U3hMul8UXnJj4=";
        };
      in
      {
        devShells."${system}" = {
          default =
            with pkgs;
            mkShell {
              packages = [
                corepack
                nodejs
              ];
            };
        };
      }
    );
}
