{ lib, username, hostname, stateVersion, pkgs, ... }:

{
  imports = [
    # local configuration
    (./pcs + "/${hostname}/home-configuration.nix")

    # environments
    ./environments/home.nix

    # apps
    ./apps/home.nix
    ./apps/options.nix
  ];

  home = {
    username = username;
    homeDirectory = lib.mkDefault "/home/${username}";
    inherit stateVersion;

    packages = with pkgs; [
      # Password manager
      bitwarden-desktop
      bitwarden-cli

      # music services
      tidal-hifi
      spotify

      # browsers
      brave

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
  };
  programs.home-manager.enable = true;
}
