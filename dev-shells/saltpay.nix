{ nixpkgs, system }:
let
  pkgs = import nixpkgs { inherit system; };
in
with pkgs;
mkShell {
  buildInputs = [
    temurin-bin-24
  ];
  packages = [
    teleport
    checkstyle
    jdt-language-server
    jetbrains-toolbox
    postgresql

    sqls
    sql-formatter
  ];

  shellHook = ''
    export XMLLINT_INDENT="    "
    export JDTLS_HOME=${jdt-language-server}
    export TESTCONTAINERS_RYUK_DISABLED=true
    export TESTCONTAINERS_RYUK_PRIVILEGED=true
  '';
}
