{ pkgs, outputs, ... }:

{
  imports = [
    outputs.nixosModules
    ./hardware-configuration.nix
  ];
  localModules = {
    name = "dosia";
    hostname = "leano";
    stateVersion = "24.11";

    swapSize = 32 * 1024;
    gpu = "nvidia";

    desktopEnvironment = "hyprland";

    apps = {
      steam.enable = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
