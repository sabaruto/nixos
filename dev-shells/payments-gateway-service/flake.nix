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

            shellHook = ''
              export MAVEN_OPTS='-Dspring-boot.run.jvmArguments=-Djavax.net.ssl.trustStore=/home/t-aaronobelley/github.com/sabaruto/nixos/secrets/truststore.jks -Djavax.net.ssl.trustStorePassword=changeit'
              export XMLLINT_INDENT="    "
              export TESTCONTAINERS_RYUK_DISABLED=true
              export TESTCONTAINERS_RYUK_PRIVILEGED=true
              export JDTLS_HOME=/etc/profiles/per-user/t-aaronobelley/bin/jdtls

              if [ ! -e ./payments-gateway-service-web/src/main/resources/application-secret.yml ]; then
                op read "op://Gateway - Dev/application-secret.yml/notesPlain" > payments-gateway-service-web/src/main/resources/application-secret.yml
              fi

              if [ ! -e ./certs/local_teya_client_certificate.pem ]; then
                ln -sf ${./secrets/local_teya_client_certificate.pem} $PWD/certs/local_teya_client_certificate.pem
                ln -sf ${./secrets/local_teya_private_key.pem} $PWD/certs/local_teya_private_key.pem
              fi

              if [ ! -e ./payments-gateway-service-web/certs ]; then
                ln -srf ./certs ./payments-gateway-service-web/certs
                ./mvnw -pl payments-gateway-service-infra io.confluent:kafka-schema-registry-maven-plugin:download
                ./mvnw -pl payments-gateway-service-infra org.apache.avro:avro-maven-plugin:schema
                mvn-clean-install
              fi
            '';
          };
      };
    });
}
