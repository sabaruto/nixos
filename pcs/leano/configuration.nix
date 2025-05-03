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

    desktopEnvironment = "kde";
    shells.zsh.enable = true;

    swapSize = 32 * 1024;
    gpu = "nvidia";

    apps = {
      steam.enable = true;
    };

    dotfiles = {
      kde.enable = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
