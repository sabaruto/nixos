{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules;
in
{
  imports = [
    ./zsh
    ./fish
  ];
  config = {
    home.packages = with pkgs; [ oh-my-posh ];

    localModules.shells = mkIf cfg.development.enable {
      zsh.enable = true;
    };

    home.shellAliases = mkMerge [
      {
        n-switch = "nixos-rebuild switch --sudo";
        n-debug = "nixos-rebuild switch --sudo --show-trace --verbose";
        n-up = "nix flake update";
      }

      (mkIf (config.home.username == "t-aaronobelley") {
        # Installation environment
        mvn-install = "./mvnw install -Dskip.unitTests -Dskip.integrationTests=true -Djacoco.skip=true -Dcheckstyle.skip=true";
        mvn-verify = "./mvnw verify -Djacoco.skip=true -Dcheckstyle.skip=true";
        mvn-clean-install = "./mvnw clean install -Dskip.unitTests -Dskip.integrationTests=true -Dcheckstyle.skip=true";
        mvn-avro-download = "./mvnw -pl payments-gateway-service-infra io.confluent:kafka-schema-registry-maven-plugin:download";
        mvn-avro-schema = "./mvnw -pl payments-gateway-service-infra org.apache.avro:avro-maven-plugin:schema";
        mvn-full-install = "./mvnw clean install";

        # Docker environment
        setup-docker = "sudo ln -s /var/run/podman/podman.sock /var/run/docker.sock; sudo chmod 666 /var/run/docker.sock; docker compose pull";

        idea = "~/.local/share/JetBrains/Toolbox/apps/intellij-idea-community-edition/bin/idea";
      })
    ];
  };
}
