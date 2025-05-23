{ pkgs, outputs, ... }:

{
  imports = [
    outputs.nixosModules.default
    outputs.nixosModules.personal
    ./hardware-configuration.nix
  ];
  localModules = {
    name = "dosia";
    hostname = "leano";
    stateVersion = "24.11";

    desktopEnvironment = "kde";

    swapSize = 32 * 1024;
    gpu = "nvidia";

    apps = { steam.enable = true; };

    dotfiles = { kde.enable = true; };

    shells = {
      zsh.enable = true;
      fish.enable = true;
    };
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      jdk21
      jdk24

      python3Full
    ];
  };
  users.defaultUserShell = pkgs.zsh;
}
