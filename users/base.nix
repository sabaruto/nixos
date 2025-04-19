{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Password Manager
    _1password-cli

    # Boot configuring
    efibootmgr

    # Visualise directories
    tree

    # Certificates
    openssl
  ];
}
