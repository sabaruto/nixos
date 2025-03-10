{ lib, config, pkgs, ... }:

with lib;

let
  cfg = config.localModules;
in
{
  config = mkIf (cfg.gpu == "nvidia") {
    # Enable nvidia video drivers
    services.xserver.videoDrivers = [ "nvidia" ];

    # Enable nvidia package
    hardware.nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
    };
  };
}
