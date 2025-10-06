{
  description = "Acceptance Quality Control Dev Shell";

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
            packages = [ bun ];

            shellHook = ''
              export MAVEN_OPTS='-Dspring-boot.run.jvmArguments=-Djavax.net.ssl.trustStore=/home/t-aaronobelley/github.com/sabaruto/nixos/secrets/truststore.jks -Djavax.net.ssl.trustStorePassword=changeit'
              export XMLLINT_INDENT="    "
              export TESTCONTAINERS_RYUK_DISABLED=true
              export TESTCONTAINERS_RYUK_PRIVILEGED=true
              export JDTLS_HOME=/etc/profiles/per-user/t-aaronobelley/bin/jdtls
            '';
          };
      };
    });
}
