{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.system.docker;
in
{
  options.localModules.system.docker.enable = mkEnableOption "Docker";

  config = mkIf cfg.enable {
    virtualisation = {
      # Enable common container config files in /etc/containers
      containers.enable = true;

      docker = {
        enable = true;
        enableOnBoot = true;

        autoPrune = {
          enable = true;
          dates = "weekly";
        };
      };
    };

    hardware.nvidia-container-toolkit.enable = true;

    users.users."${config.localModules.name}".extraGroups = [ "docker" ];
    environment = {

      variables = {
        DOCKER_HOST = "unix:///run/docker.sock";
      };

      # Useful other development tools
      systemPackages = with pkgs; [
        dive # look into docker image layers
        docker-compose # start group of containers for dev
      ];
    };
  };
}
