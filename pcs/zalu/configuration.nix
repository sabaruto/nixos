{ outputs, pkgs, ... }:
{
  imports = [
    outputs.nixosModules.default
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  localModules = {
    name = "dosia";
    hostname = "zalu";
    stateVersion = "24.11";

    swapSize = 16 * 1024;
    gpu = "none";

    desktopEnvironment = "gnome";

    shells.zsh.enable = true;

    apps = {
      steam.enable = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
