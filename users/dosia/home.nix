{
  lib,
  pkgs,
  outputs,
  ...
}:

{
  imports = [
    outputs.homeManagerModules
  ];
  home = {
    username = "dosia";
    homeDirectory = lib.mkDefault "/home/dosia";
    stateVersion = "24.11";

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

      # miracast
      gnome-network-displays
      openh264
      x264
      faac
      dnsmasq

      syncthing
    ];
  };
  localModules = {
    apps = {
      git.enable = true;
      zen.enable = true;
      neovim.enable = true;
    };

    development = {
      enable = true;
      installOnNixos = true;
      languages = [
        "nix"
        "lua"
        "java"
        "golang"
        "typescript"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
