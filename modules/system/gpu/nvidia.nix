{ lib, config, ... }:

with lib;

let cfg = config.localModules;
in {
  config = mkIf (cfg.gpu == "nvidia") {
    # Enable nvidia video drivers
    services.xserver.videoDrivers = [ "nvidia" ];

    # Enable nvidia package
    hardware = {
      graphics = true;

      nvidia = {
        open = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        nvidiaPersistenced = true;
        powerManagement.enable = true;
        modesetting.enable = true;
        videoAcceleration = true;
      };
    };
  };
}
