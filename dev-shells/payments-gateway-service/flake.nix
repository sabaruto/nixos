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
              if [ ! -e ./payments-gateway-service-web/src/main/resources/application-secret.yml ]; then
                op read "op://Gateway - Dev/application-secret.yml/notesPlain" > payments-gateway-service-web/src/main/resources/application-secret.yml
              fi

              if [ ! -e ./certs/local_teya_client_certificate.pem ]; then
                ln -sf ${./secrets/local_teya_client_certificate.pem} $PWD/certs/local_teya_client_certificate.pem
                ln -sf ${./secrets/local_teya_private_key.pem} $PWD/certs/local_teya_private_key.pem
              fi

              if [ ! -e ./payments-gateway-service-web/certs ]; then
                ln -srf ./certs ./payments-gateway-service-web/certs
              fi
            '';
          };
      };
    });
}
