{ nixpkgs, system }:
let
  pkgs = import nixpkgs { inherit system; };
in
with pkgs;
mkShell {
  packages = [
    zulu24
    jdt-language-server
  ];

  shellHook = ''
    export JDTLS_HOME=${jdt-language-server}
  '';
}
