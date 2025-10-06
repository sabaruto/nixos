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

              mkdir -p .cmd

              if [ ! -e .cmd/run-k6.sh ]; then
                if [ $? -ne 0 ]; then
                  eval $(op signin)
                fi
               
               echo '
                k6 run \
                  -e GATEWAY_OAUTH_CLIENT_SECRET="op://Gateway - Dev/Payments Gateway Service/password" \
                  -e SMOKE_TEST_TERMINAL_SECRET_UK="op://DevEnv/K6 Terminal Secrets /SMOKE_TEST_TERMINAL_SECRET_UK" \
                  -e SMOKE_TEST_TERMINAL_SECRET_HU="op://DevEnv/K6 Terminal Secrets /SMOKE_TEST_TERMINAL_SECRET_HU" \
                  -e SMOKE_TEST_TERMINAL_SECRET_HR="op://DevEnv/K6 Terminal Secrets /SMOKE_TEST_TERMINAL_SECRET_HR" \
                  -e SMOKE_TEST_TERMINAL_SECRET_IS="op://DevEnv/K6 Terminal Secrets /SMOKE_TEST_TERMINAL_SECRET_IS" \
                  -e SMOKE_TEST_TERMINAL_SECRET_PT="op://DevEnv/K6 Terminal Secrets /SMOKE_TEST_TERMINAL_SECRET_PT" \
                  -e SMOKE_TEST_TERMINAL_SECRET_CZ="op://DevEnv/K6 Terminal Secrets /SMOKE_TEST_TERMINAL_SECRET_CZ" \
                  -e SMOKE_TEST_TERMINAL_SECRET_SK="op://DevEnv/K6 Terminal Secrets /SMOKE_TEST_TERMINAL_SECRET_SK" \
                  -e SMOKE_TEST_TERMINAL_SECRET_UK_SOFTPOS="op://DevEnv/K6 Terminal Secrets /SMOKE_TEST_TERMINAL_SECRET_UK_SOFTPOS" \
                  -e SMOKE_TEST_TERMINAL_SECRET_UK_SOLAR="op://DevEnv/K6 Terminal Secrets /SMOKE_TEST_TERMINAL_SECRET_UK_SOLAR" \
                  -e SMOKE_TEST_SERVICE_BASE_URL=https\://payments-gateway-service.cde-dev.eu-west-1.salt  \
                  -e SMOKE_TEST_SERVICE_FX_URL=https\://private-api.teya.xyz k8s/chart/smoketests/smoke.js' | op inject -o .cmd/run-k6.sh 
                  
                chmod u+x .cmd/run-k6.sh
              fi

              if [ ! -e ./payments-gateway-service-web/src/main/resources/application-secret.yml ]; then
                op user list > /dev/null

                if [$? -ne 0]; then
                  eval $(op signin)
                fi
                
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
