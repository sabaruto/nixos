{ lib, config, pkgs, ... }:

{
  home = {
    username = "dosia";
    homeDirectory = lib.mkDefault "/home/dosia";
    stateVersion = config.localModules.stateVersion;

    packages = with pkgs; [
      # Password manager
      bitwarden-desktop
      bitwarden-cli

      # music services
      tidal-hifi
      spotify

      # browsers
      brave
      firefox

      # zoom
      zoom-us

      # cursors
      google-cursor

      # boot configuration
      efibootmgr

      # cli apps
      tree
      openssl
    ];

    localModules = {
      environments.ssm.enable = true;

      development = {
        enable = true;
        languages = [ "nix" ];
      };
    };
  };
  programs.home-manager.enable = true;
}
