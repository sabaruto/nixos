{ config, lib, pkgs, outputs, ... }: {
  imports = [ outputs.nixosModules.default ];
  localModules = {
    name = "t-aaronobelley";
    hostname = "halu";
    stateVersion = "24.11";
  };

  wsl = {
    enable = true;
    defaultUser = "t-aaronobelley";
  };
}
