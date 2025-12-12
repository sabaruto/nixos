{
  description = "Dev shells flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystemPassThrough (system: {

      devShells."${system}" = {
        default =
          let
            pkgs = import nixpkgs { inherit system; };
          in
          with pkgs;
          mkShell {
            XMLLINT_INDENT="    ";
            TESTCONTAINERS_RYUK_DISABLED=true;
            TESTCONTAINERS_RYUK_PRIVILEGED=true;
            JDTLS_HOME="/etc/profiles/per-user/t-aaronobelley/bin/jdtls";
          };
      };
    });
}
