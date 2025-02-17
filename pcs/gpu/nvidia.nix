{ config, pkgs, ... }:
{
  # Enable nvidia video drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable nvidia package
  hardware.nvidia = {
  	open = true;
  	package = config.boot.kernelPackages.nvidiaPackages.stable;
  	modesetting.enable = true;
  };
}
