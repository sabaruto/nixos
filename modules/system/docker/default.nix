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
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
      };
    };

    hardware.nvidia-container-toolkit.enable = true;
    users.extraGroups.docker.members = [ config.localModules.name ];

    # Useful other development tools
    environment.systemPackages = with pkgs; [
      dive # look into docker image layers
      docker-compose # start group of containers for dev
      lazydocker
    ];
  };
}
