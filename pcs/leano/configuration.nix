{ pkgs, outputs, ... }:

{
  imports = [
    outputs.nixosModules.default
    ./hardware-configuration.nix
  ];
  localModules = {
    name = "dosia";
    hostname = "leano";
    stateVersion = "24.11";

    swapSize = 32 * 1024;
    gpu = "nvidia";

    desktopEnvironment = "hyprland";

    shells.zsh.enable = true;

    apps = {
      steam.enable = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
