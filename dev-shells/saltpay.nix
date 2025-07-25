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

    postgresql
  ];

  shellHook = ''
    export MAVEN_OPTS='-Dspring-boot.run.jvmArguments=-Djavax.net.ssl.trustStore=/home/t-aaronobelley/github.com/sabaruto/nixos/secrets/truststore.jks -Djavax.net.ssl.trustStorePassword=changeit'
    export XMLLINT_INDENT="    "
    export JDTLS_HOME=${jdt-language-server}
  '';
}
