{
  description = "Backoffice bff flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/c792c60b8a97daa7efe41a6e4954497ae410e0c1";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystemPassThrough (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells."${system}" = {
          default =
            with pkgs;
            mkShell {
              packages = [
                yarn
                nodejs
                git-secrets
                typescript
                typescript-language-server
              ];
            };
        };
      }
    );
}
