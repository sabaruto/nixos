{
  description = "Local packages flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs { inherit system; };
      kulala-ls = pkgs.callPackage ./kulala { inherit pkgs; };
      cspell-lsp = pkgs.callPackage ./cspell-lsp { inherit pkgs; };
      java-debug = with import nixpkgs { inherit system; }; callPackage ./java-debug { };
    in
    {
      packages."${system}" = {
        inherit kulala-ls cspell-lsp java-debug;
      };

      overlays.default = _: _: {
        inherit kulala-ls cspell-lsp java-debug;
      };
    };
}
