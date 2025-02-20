{ lib, config, pkgs, ... }:
let
  zenApp = import ../../derivations/zen.nix { inherit pkgs; };
in
{
  imports = 
  [
      # Development
      ../../apps/zsh.nix

      ../../apps/tmux.nix

      ../../apps/git.nix

      # ------------------------------
      # Vscode Packages
      # ------------------------------

      # default
      ../../apps/vscode.nix

      # Themes
      ../../apps/vscode-extensions/themes.nix
  ];

  programs.home-manager.enable = true;

  home.username = "dosia";
  home.homeDirectory = lib.mkDefault "/home/dosia";
  
  home.packages = with pkgs; [
      # Password Manager
      _1password-gui

      _1password-cli
      
      # Music Services
      tidal-hifi
      spotify

      # Chromium Browser
      brave

      # Current browser
      zenApp

      # Zoom
      zoom-us

      # Curosr
      google-cursor

      tree

      efibootmgr
  ];

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";
}