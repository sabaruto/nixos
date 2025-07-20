{ nixpkgs, system }:
let
  pkgs = import nixpkgs { inherit system; };
in
with pkgs;
mkShell {
  packages = [
    teleport
    checkstyle
    jetbrains.idea-community

    postgresql

    # Other java installations
    temurin-bin-24
    # temurin-bin-17
    # temurin-bin-11
  ];

  shellHook = ''
    export MAVEN_OPTS='-Dspring-boot.run.jvmArguments=-Djavax.net.ssl.trustStore=/home/t-aaronobelley/github.com/sabaruto/nixos/secrets/truststore.jks -Djavax.net.ssl.trustStorePassword=changeit'
    export XMLLINT_INDENT="    "
  '';
}
