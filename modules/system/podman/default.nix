{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.system.podman;
in
{
  options.localModules.system.podman.enable = mkEnableOption "Podman";

  config = mkIf cfg.enable {
    virtualisation = {

      # Enable common container config files in /etc/containers
      containers.enable = true;

      podman = {
        enable = true;

        # Create a `docker` alias for podman, to use it as a drop-in replacement
        dockerCompat = true;
        dockerSocket.enable = true;

        # Required for containers under podman-compose to be able to talk to each other.
        defaultNetwork.settings.dns_enabled = true;
      };
    };

    hardware.nvidia-container-toolkit.enable = true;
    users.extraGroups.podman.members = [ config.localModules.name ];

    # Useful other development tools
    environment.systemPackages = with pkgs; [
      dive # look into docker image layers
      podman-tui # status of containers in the terminal
      docker-compose # start group of containers for dev
      # podman-compose # start group of containers for dev

      lazydocker
    ];
  };
}
